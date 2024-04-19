module Api
  module V1
    class EnrollmentsController < ApplicationController
      before_action :set_enrollment, only: %i[ show update destroy ]
      after_action :create_bills, only: %i[ create ]

      # GET /enrollments
      def index
        @enrollments = Enrollment.all

        render json: @enrollments
      end

      # GET /enrollments/1
      def show
        render json: @enrollment
      end

      # POST /enrollments
      def create
        @enrollment = Enrollment.new(enrollment_params)

        if @enrollment.save
          render json: @enrollment, status: :created, location: url_for([:api, :v1, @enrollment])
        else
          render json: @enrollment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /enrollments/1
      def update
        if @enrollment.update(enrollment_params)
          render json: @enrollment
        else
          render json: @enrollment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /enrollments/1
      def destroy
        @enrollment.destroy!
      end

      def create_bills
        @bills = []

        date = Date.parse(Time.now.strftime("%d/%m/%Y"))
        begin_next_month = (@enrollment.bill_due_date <= date.day) ? 1 : 0

        # Conficional para pegar data da primeira fatura gerada
        if begin_next_month
          # Esse condicional só cai em um cenário completamente anormal
          # em que a bill_due_date é 31 e a matrícula é criada dia 31.
          if not Date.valid_date?(date.year, date.mon + 1, @enrollment.bill_due_date)
            bill_date = date.next_month.end_of_month
          else
            bill_date = Date.parse("#{@enrollment.bill_due_date.to_s}/#{date.mon + 1}/#{date.year}")
          end
        else
          if not Date.valid_date?(date.year, date.mon, @enrollment.bill_due_date)
            bill_date = date.end_of_month
          else
            bill_date = Date.parse("#{@enrollment.bill_due_date.to_s}/#{date.mon}/#{date.year}")
          end
        end

        @enrollment.number_of_bills.times do
          current_bill = Bill.new(
            bill_cost: @enrollment.total_cost / @enrollment.number_of_bills,
            due_date: bill_date,
            enrollment: @enrollment,
            status: "Aberta"
          )
          @bills.append(current_bill.save!)

          if bill_date.day < @enrollment.bill_due_date
            bill_date += (@enrollment.bill_due_date - bill_date.day).days
          else
            bill_date += 1.months
          end

          bill_day, bill_month, bill_year = @enrollment.bill_due_date, bill_date.month, bill_date.year

          if not Date.valid_date?(bill_year, bill_month, bill_day)
            bill_date = bill_date.end_of_month
          else
            bill_date = Date.parse("#{bill_day.to_s}/#{bill_month}/#{bill_year}")
          end
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_enrollment
          @enrollment = Enrollment.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def enrollment_params
          params.require(:enrollment).permit(:total_cost, :number_of_bills, :bill_due_date, :course_name, :institution_id, :student_id)
        end
    end
  end
end

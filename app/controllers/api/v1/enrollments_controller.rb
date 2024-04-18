module Api
  module V1
    class EnrollmentsController < ApplicationController
      before_action :set_enrollment, only: %i[ show update destroy ]

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
          @bills = []

          curr_date = Time.now.strftime("%d/%m/%Y")
          date = Date.parse(curr_date)
          curr_day = date.day
          bill_date = Date.parse("#{@enrollment.bill_due_date.to_s}/#{date.mon}/#{date.year}")

          month_addition = (@enrollment.bill_due_date <= curr_day) ? 1 : 0

          @enrollment.number_of_bills.times do
            current_bill = Bill.new(
              bill_cost: @enrollment.total_cost / @enrollment.number_of_bills,
              due_date: bill_date + month_addition.months,
              enrollment: @enrollment,
              status: "Aberta"
            )
            month_addition += 1
            @bills.append(current_bill.save!)
          end

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

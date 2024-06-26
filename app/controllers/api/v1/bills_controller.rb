module Api
  module V1
    class BillsController < ApplicationController
      before_action :set_bill, only: %i[ show update destroy ]
      before_action :set_enrollment, only: %i[ enrollment_bills ]

      # GET /bills
      def index
        @bills = Bill.all

        render json: @bills
      end

      # GET /enrollment/:id/bills
      def enrollment_bills
        @bills = Bill.where(enrollment_id: @enrollment.id)

        render json: @bills
      end

      # GET /bills/1
      def show
        render json: @bill
      end

      # POST /bills
      def create
        @bill = Bill.new(bill_params)

        if @bill.save
          render json: @bill, status: :created, location: url_for([:api, :v1, @bill])
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /bills/1
      def update
        if @bill.update(bill_params)
          render json: @bill
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      end

      # DELETE /bills/1
      def destroy
        @bill.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_bill
          @bill = Bill.find(params[:id])
        end

        # Set the enrollment for the bill
        def set_enrollment
          @enrollment = Enrollment.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def bill_params
          params.require(:bill).permit(:bill_cost, :due_date, :enrollment_id, :status)
        end
    end
  end
end

module Api
  module V1
    class InstitutionsController < ApplicationController
      before_action :set_institution, only: %i[ show update destroy ]

      # GET /institutions
      def index
        @institutions = Institution.all

        render json: @institutions
      end

      # GET /institutions/1
      def show
        render json: @institution
      end

      # POST /institutions
      def create
        @institution = Institution.new(institution_params)

        if @institution.save
          render json: @institution, status: :created, location: url_for([:api, :v1, @institution])
        else
          render json: @institution.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /institutions/1
      def update
        if @institution.update(institution_params)
          render json: @institution
        else
          render json: @institution.errors, status: :unprocessable_entity
        end
      end

      # DELETE /institutions/1
      def destroy
        @institution.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_institution
          @institution = Institution.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def institution_params
          params.require(:institution).permit(:name, :cnpj, :institution_type)
        end
    end
  end
end

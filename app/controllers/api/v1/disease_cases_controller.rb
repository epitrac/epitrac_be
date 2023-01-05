module Api 
  module V1 
    class DiseaseCasesController < ApplicationController 
      def show 
        render json: DiseaseCaseSerializer.new(DiseaseCaseFacade.states_diseases(params[:state]))
      end
    end
  end
end
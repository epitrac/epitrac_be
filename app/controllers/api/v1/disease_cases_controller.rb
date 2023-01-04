module Api 
  module V1 
    class DiseaseCasesController < ApplicationController 
      def index 
        # require 'pry'; binding.pry
        render json: DiseaseCaseSerializer.new(DiseaseCaseFacade.states_diseases(params[:state]))
      end
    end
  end
end
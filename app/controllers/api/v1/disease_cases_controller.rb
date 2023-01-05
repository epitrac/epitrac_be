class Api::V1::DiseaseCasesController < ApplicationController 
  def index 
    render json: DiseaseCaseSerializer.new(DiseaseCaseFacade.states_diseases(params[:state]))
  end
end

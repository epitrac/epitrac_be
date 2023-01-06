class Api::V1::DiseaseCasesController < ApplicationController 
  def index 
    if params[:state]
      render json: DiseaseCaseSerializer.new(DiseaseCaseFacade.states_diseases(params[:state]))
    else
      render json: DiseaseCaseSerializer.new(DiseaseCaseFacade.disease_cases)
    end 
  end
end
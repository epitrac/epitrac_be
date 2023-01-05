class Api::V1::DiseaseCasesController < ApplicationController
  def index
    render json: DiseaseCaseSerializer.new(DiseaseCase.all)
  end
end
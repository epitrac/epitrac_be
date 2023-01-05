class DiseaseDataController < ApplicationController
  def index
    render json: DiseaseCaseSerializer.new(DiseaseCase.all)
  end
end
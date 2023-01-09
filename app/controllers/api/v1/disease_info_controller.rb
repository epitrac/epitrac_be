class Api::V1::DiseaseInfoController < ApplicationController
  def index
    if params[:disease]
      diseases = Disease.partial_match(params[:disease])
      render json: DiseaseInfoSerializer.new(diseases)
    else
      render json: DiseaseInfoSerializer.new(Disease.all)

    end
  end
end
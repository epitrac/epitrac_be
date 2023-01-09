class Api::V1::DiseaseInfoController < ApplicationController
  def index
    if params[:short_name]
      diseases = Disease.partial_match(params[:short_name])
      render json: DiseaseInfoSerializer.new(diseases)
    else
      render json: DiseaseInfoSerializer.new(Disease.all)

    end
  end
end
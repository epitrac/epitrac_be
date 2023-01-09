class Api::V1::DiseaseInfoController < ApplicationController
  def index
    if params[:short_name]
      diseases = Disease.partial_match(params[:short_name])
      render json: DiseaseInfoSerializer.new(diseases)
    else
      render json: {error: "cannot return disease info without a disease"}, status: 404

    end
  end
end
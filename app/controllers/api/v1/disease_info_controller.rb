class Api::V1::DiseaseInfoController < ApplicationController
  def index
    render json: DiseaseInfoSerializer.new(Disease.find_by(disease: params[:disease]))
  end
end
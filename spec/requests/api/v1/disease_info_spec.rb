require 'rails_helper'

RSpec.describe 'disease info' do
  it 'gets information about a given disease' do
    disease_info = create(:disease, disease: "Syphilis")

    get "/api/v1/disease_info?disease=Syphilis"

    expect(response).to be_successful

    disease = JSON.parse(response.body, symbolize_names: true)[:data][0]
    expect(disease[:attributes]).to have_key(:disease)
    expect(disease[:attributes][:disease]).to be_a(String)
    
    expect(disease[:attributes]).to have_key(:information)
    expect(disease[:attributes][:disease]).to be_a(String)

    expect(disease[:attributes]).to have_key(:link)
    expect(disease[:attributes][:disease]).to be_a(String)
  end

  it 'accepts partial matches' do 
    disease_info = create(:disease, disease: "Anthrax")

    get "/api/v1/disease_info?disease=anthra"
    expect(response).to be_successful

    disease = JSON.parse(response.body, symbolize_names: true)[:data][0]
    expect(disease[:attributes][:disease]).to eq("Anthrax")
    expect(disease[:attributes][:disease]).to_not eq("Syphilis")

  end

  it 'disease info request is case insensitive' do 
    disease_info = create(:disease, disease: "Anthrax")
    get "/api/v1/disease_info?disease=ANTHRA"
    expect(response).to be_successful

    disease = JSON.parse(response.body, symbolize_names: true)[:data][0]
    expect(disease[:attributes][:disease]).to eq("Anthrax")
    expect(disease[:attributes][:disease]).to_not eq("Syphilis")

  end

  it 'sad path, returns error without a disease' do 
    get "/api/v1/disease_info"

    expect(response).to have_http_status 404
    errors = JSON.parse(response.body, symbolize_names: true)
    expect(errors[:error]).to eq("cannot return disease info without a disease")

  end
end
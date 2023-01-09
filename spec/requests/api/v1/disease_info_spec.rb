require 'rails_helper'

RSpec.describe 'disease info' do
  it 'gets information about a given disease' do
    disease_info = create(:disease, short_name: "Syphilis")

    get "/api/v1/disease_info?short_name=Syphilis"

    expect(response).to be_successful

    disease = JSON.parse(response.body, symbolize_names: true)[:data][0]
    expect(disease[:attributes]).to have_key(:disease)
    expect(disease[:attributes][:disease]).to be_a(String)
    
    expect(disease[:attributes]).to have_key(:information)
    expect(disease[:attributes][:information]).to be_a(String)

    expect(disease[:attributes]).to have_key(:link)
    expect(disease[:attributes][:link]).to be_a(String)

    expect(disease[:attributes]).to have_key(:short_name)
    expect(disease[:attributes][:short_name]).to be_a(String)
  end

  it 'accepts partial matches' do 
    disease_info = create(:disease, short_name: "Anthrax")

    get "/api/v1/disease_info?short_name=anthra"
    expect(response).to be_successful

    disease = JSON.parse(response.body, symbolize_names: true)[:data][0]
    expect(disease[:attributes][:short_name]).to eq("Anthrax")
    expect(disease[:attributes][:short_name]).to_not eq("Syphilis")

  end

  it 'disease info request is case insensitive' do 
    disease_info = create(:disease, short_name: "Anthrax")
    get "/api/v1/disease_info?short_name=ANTHRA"
    expect(response).to be_successful

    disease = JSON.parse(response.body, symbolize_names: true)[:data][0]
    expect(disease[:attributes][:short_name]).to eq("Anthrax")
    expect(disease[:attributes][:short_name]).to_not eq("Syphilis")

  end

  it 'without a disease it returns all of the diseases' do 
    disease_info = create(:disease, short_name: "Anthrax")
    disease_info2 = create(:disease, short_name: "Syphilis")


    get "/api/v1/disease_info"

    expect(response).to be_successful

    diseases = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(diseases.count).to eq(2)

  end
end
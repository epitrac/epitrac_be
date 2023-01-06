require 'rails_helper'

RSpec.describe 'disease info' do
  it 'gets information about a given disease' do
    disease_info = create(:disease)

    get "/api/v1/disease_info?disease=#{disease_info.disease}"

    expect(response).to be_successful

    disease = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(disease[:attributes]).to have_key(:disease)
    expect(disease[:attributes][:disease]).to be_a(String)
    
    expect(disease[:attributes]).to have_key(:information)
    expect(disease[:attributes][:disease]).to be_a(String)

    expect(disease[:attributes]).to have_key(:link)
    expect(disease[:attributes][:disease]).to be_a(String)
  end
end
require 'rails_helper'

RSpec.describe 'disease cases endpoint' do
  it 'gets all disease cases for all states', :vcr do
    get '/api/v1/disease_cases'

    expect(response).to be_successful

    cases = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(cases[0][:attributes]).to have_key(:state)
    expect(cases[0][:attributes][:state]).to be_a(String)
  end
end
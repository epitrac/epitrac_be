require 'rails_helper'

RSpec.describe 'disease cases endpoint' do
  it 'gets all disease cases for all states', :vcr do
    get '/api/v1/disease_cases'

    expect(response).to be_successful

    cases = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(cases[0][:attributes]).to have_key(:state)
    expect(cases[0][:attributes][:state]).to be_a(String)

    expect(cases[0][:attributes]).to have_key(:year)
    expect(cases[0][:attributes][:year]).to be_a(String)

    expect(cases[0][:attributes]).to have_key(:current_week)
    expect(cases[0][:attributes][:current_week]).to be_a(Integer)

    expect(cases[0][:attributes]).to have_key(:disease)
    expect(cases[0][:attributes][:disease]).to be_a(String)

    expect(cases[0][:attributes]).to have_key(:cumulative_current)
    expect(cases[0][:attributes][:cumulative_current]).to be_a(Integer)

    expect(cases[0][:attributes]).to have_key(:cumulative_last)
    expect(cases[0][:attributes][:cumulative_last]).to be_a(Integer)

    expect(cases[0][:attributes]).to have_key(:coordinates)
    expect(cases[0][:attributes][:coordinates]).to be_a(Array)

    expect(cases[0][:attributes]).to have_key(:id)
    expect(cases[0][:attributes][:id]).to be_a(String)

    expect(cases[0][:attributes]).to have_key(:current_week_cases)
    expect(cases[0][:attributes][:current_week_cases]).to be_a(Integer)
  end

  it 'returns disease data for a particular state', :vcr do
    get '/api/v1/disease_cases?state=GEORGIA' 

    expect(response).to be_successful

    cases = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(cases[0][:attributes]).to have_key(:state)
    expect(cases[0][:attributes][:state]).to be_a(String)

    expect(cases[0][:attributes]).to have_key(:year)
    expect(cases[0][:attributes][:year]).to be_a(String)

    expect(cases[0][:attributes]).to have_key(:current_week)
    expect(cases[0][:attributes][:current_week]).to be_a(Integer)

    expect(cases[0][:attributes]).to have_key(:disease)
    expect(cases[0][:attributes][:disease]).to be_a(String)

    expect(cases[0][:attributes]).to have_key(:cumulative_current)
    expect(cases[0][:attributes][:cumulative_current]).to be_a(Integer)

    expect(cases[0][:attributes]).to have_key(:cumulative_last)
    expect(cases[0][:attributes][:cumulative_last]).to be_a(Integer)

    expect(cases[0][:attributes]).to have_key(:coordinates)
    expect(cases[0][:attributes][:coordinates]).to be_a(Array)

    expect(cases[0][:attributes]).to have_key(:id)
    expect(cases[0][:attributes][:id]).to be_a(String)

    expect(cases[0][:attributes]).to have_key(:current_week_cases)
    expect(cases[0][:attributes][:current_week_cases]).to be_a(Integer)
  end
end
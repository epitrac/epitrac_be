require 'rails_helper'

RSpec.describe 'disease cases endpoint' do
  it 'gets all disease cases for all states' do
    attributes_1 = {
        "states": "CONNECTICUT",
        "year": "2022",
        "week": "1",
        "label": "Malaria",
        "m1_flag": "-",
        "m2": "2",
        "m2_flag": "-",
        "m3_flag": "-",
        "m4_flag": "-",
        "location1": "CONNECTICUT",
        "sort_order": "20220103923",
        "geocode": {
            "type": "Point",
            "coordinates": [
                -72.738288,
                41.575155
            ]}}

    attributes_2 = {
      "states": "CONNECTICUT",
      "year": "2022",
      "week": "1",
      "label": "Malaria",
      "m1_flag": "-",
      "m2": "2",
      "m2_flag": "-",
      "m3_flag": "-",
      "m4_flag": "-",
      "location1": "CONNECTICUT",
      "sort_order": "20220103923",
      "geocode": {
          "type": "Point",
          "coordinates": [
              -72.738288,
              41.575155
          ]}}
    DiseaseCase.new(attributes_1)
    DiseaseCase.new(attributes_2)
    
    get '/api/v1/disease_data'

    expect(response).to be_successful

    cases = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(cases[0][:attributes]).to have_key(:state)
    expect(cases[0][:attributes][:state]).to be_a(String)
  end
end
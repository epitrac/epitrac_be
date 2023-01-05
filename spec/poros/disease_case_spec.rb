require 'rails_helper'

RSpec.describe DiseaseCase do
  describe 'initialize' do
    it 'exists' do
      attributes = {
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

        state_data = DiseaseCase.new(attributes)
        expect(state_data).to be_instance_of(DiseaseCase)
        expect(state_data.state).to eq("CONNECTICUT")
        expect(state_data.year).to eq("2022")
        expect(state_data.current_week).to eq(1)
        expect(state_data.disease).to eq("Malaria")
        expect(state_data.current_week_cases).to eq(0)
        expect(state_data.cumulative_current).to eq(nil)
        expect(state_data.cumulative_last).to eq(nil)
        expect(state_data.coordinates).to eq([-72.738288, 41.575155])
    end
  end
end
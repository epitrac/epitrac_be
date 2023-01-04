require 'rails_helper'

RSpec.describe DiseaseCaseFacade, :vcr, type: :facade do 
  describe 'creating disease cases' do 
    it 'it creates an array of objects' do 
      facade = DiseaseCaseFacade.states_diseases("GEORGIA")

      expect(facade).to be_an Array 
      expect(facade[0]).to be_an_instance_of(DiseaseCase)
      expect(facade[0].state).to eq("GEORGIA")
      expect(facade[0].state).to_not eq("COLORADO")

      expect(facade[0].current_week).to eq("1")
      expect(facade[0].disease).to eq("Anthrax")
      expect(facade[0].current_week_cases).to eq("0")

    end
  end
end
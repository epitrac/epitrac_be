require 'rails_helper'

RSpec.describe DiseaseCaseFacade, :vcr, type: :facade do 
  describe 'creating disease cases' do 
    it 'it creates an array of objects' do 
      facade = DiseaseCaseFacade.states_diseases("GEORGIA")

      expect(facade).to be_an Array 
      expect(facade[0]).to be_an_instance_of(DiseaseCase)
      expect(facade[0].state).to eq("GEORGIA")
    end
  end
end
require 'rails_helper'

RSpec.describe DiseaseCaseFacade do
  describe 'class methods' do
    describe '#disease_cases' do
      it 'should create disease case object from json data', :vcr do
        expect(DiseaseCaseFacade.disease_cases).to be_an(Array)
        expect(DiseaseCaseFacade.disease_cases[0]).to be_instance_of(DiseaseCase)
      end

      it 'it creates an array of objects', :vcr do
        facade = DiseaseCaseFacade.states_diseases("GEORGIA")

        expect(facade).to be_an Array
        expect(facade[0]).to be_an_instance_of(DiseaseCase)
        expect(facade[0].state).to eq("GEORGIA")
        expect(facade[0].state).to_not eq("COLORADO")
        
        expect(facade[0].current_week).to eq(52)

        expect(facade[0].disease).to eq("Anthrax")
        expect(facade[0].current_week_cases).to eq(0)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe DiseaseCaseFacade do
  describe 'class methods', :vcr do
    describe '#disease_cases' do
      it 'should create disease case object from json data' do
        expect(DiseaseCaseFacade.disease_cases).to be_an(Array)
        expect(DiseaseCaseFacade.disease_cases[0]).to be_instance_of(DiseaseCase)
      end
    end
  end
end
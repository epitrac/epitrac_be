require 'rails_helper'

RSpec.describe DiseaseCase, :vcr, type: :poros do
  describe 'it returns disease case objects' do 
    it 'response is returned in disease case objects with defined attributes' do 
      diseases = DiseaseCaseFacade.states_diseases("GEORGIA")
      expect(diseases).to be_an Array 

      disease = diseases.first 

      expect(disease).to be_an_instance_of DiseaseCase
      expect(disease.current_week).to be_a String 
      expect(disease.state).to be_a String 
      expect(disease.year).to be_a String 
      expect(disease.geocode).to be_a Hash  

      
    end
  end


end
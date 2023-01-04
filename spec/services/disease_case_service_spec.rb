require 'rails_helper' 

RSpec.describe DiseaseCaseService do 
  describe 'returns results and attributes for diseases by state' do 
    it 'is an array with certain attributes', :vcr do 
      all_diseases= DiseaseCaseService.diseases_by_state("GEORGIA")

      expect(all_diseases).to be_an Array 

      disease_case = all_diseases.first 

      expect(disease_case[:states]).to be_a String 
      expect(disease_case[:year]).to be_a String 
      expect(disease_case[:week]).to be_a String 
      expect(disease_case[:label]).to be_a String 
      expect(disease_case[:m2]).to be_a String 
      expect(disease_case[:geocode]).to be_a Hash 
      expect(disease_case[:geocode][:coordinates]).to be_an Array  


    end
  end
end
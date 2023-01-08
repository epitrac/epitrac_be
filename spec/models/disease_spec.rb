require 'rails_helper'

RSpec.describe Disease, type: :model do
  describe 'validations' do
    it { should validate_presence_of :disease }
    it { should validate_presence_of :information }
    it { should validate_presence_of :link }
  end

  describe '#partial_match' do 
    it 'disease can be a partial match and case insensitive' do 
      disease_info = create(:disease, disease: "Anthrax")
      other_disease_info = create(:disease, disease: "Syphilis")

      expect(Disease.partial_match("Anthr")[0]).to eq(disease_info)
      expect(Disease.partial_match("Anthr")[0]).to_not eq(other_disease_info)


      expect(Disease.partial_match("SYPHIL")[0]).to eq(other_disease_info)
      expect(Disease.partial_match("SYPHIL")[0]).to_not eq(disease_info)
    end
  end
end
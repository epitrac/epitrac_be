require 'rails_helper'
  
RSpec.describe ArticleService do
  describe 'returns results and attributes for articles for a disease' do 
    it 'is an array with certain attributes', :vcr do 

      articles= DiseaseCaseService.diseases_by_state("anthrax")
      expect(articles).to be_an Array 

      article = articles.first 

      expect(article[:author]).to be_a String 
      expect(article[:year]).to be_a String 
      expect(article[:title]).to be_a String 
      expect(article[:isbn_issn]).to be_a String 
      expect(article[:author]).to be_a String 
      expect(article[:keywords]).to be_a String 
      expect(article[:doi]).to be_an String 
    end
  end
end
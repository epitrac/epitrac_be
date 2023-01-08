require 'rails_helper'
  
RSpec.describe ArticleService do
  describe 'returns results and attributes for articles for a disease' do 
    it 'is an array with certain attributes', :vcr do 

      articles= ArticleService.articles_by_disease("anthrax")
      expect(articles).to be_an Array 

      article = articles.first 

      expect(article).to have_key(:author)
      expect(article[:author]).to be_a(String)
      
      expect(article).to have_key(:year)
      expect(article[:year]).to be_a(String)

      expect(article).to have_key(:title)
      expect(article[:title]).to be_a(String)

      expect(article).to have_key(:isbn_issn)
      expect(article[:isbn_issn]).to be_a(String)

      expect(article).to have_key(:author)
      expect(article[:author]).to be_a(String)

      expect(article).to have_key(:keywords)
      expect(article[:keywords]).to be_a(String)

      expect(article).to have_key(:doi)
      expect(article[:doi]).to be_an(String)

      expect(article).to have_key(:url)
      expect(article[:url]).to be_an(String)

      expect(article).to have_key(:abstract)
      expect(article[:abstract]).to be_an(String)

      expect(article).to have_key(:date)
      expect(article[:date]).to be_an(String)

      expect(article).to have_key(:record_number)
      expect(article[:record_number]).to be_an(String)
    end
  end

  describe 'show one article endpoint' do 
    it 'returns an articles data based on article id', :vcr do 
      article= ArticleService.one_article("1076")

      expect(article).to be_an Array 

      expect(article[0]).to have_key(:author)
      expect(article[0][:author]).to be_a(String)
      
      expect(article[0]).to have_key(:year)
      expect(article[0][:year]).to be_a(String)

      expect(article[0]).to have_key(:title)
      expect(article[0][:title]).to be_a(String)
      expect(article.count).to eq(1)
    end
  end
end
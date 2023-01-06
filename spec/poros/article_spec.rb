require 'rails_helper'

RSpec.describe Article, type: :poros do

  describe 'it returns article objects', :vcr do 
    it 'response is returned in article objects with defined attributes' do 
      articles = ArticleFacade.articles("anthrax")
      expect(articles).to be_an Array 

      article = articles.first 

      expect(article).to be_an_instance_of Article
      expect(article.id).to be_a String 
      expect(article.title).to be_a String 
      expect(article.year).to be_a String 
      expect(article.keywords).to be_an String  
    end 
  end 
end

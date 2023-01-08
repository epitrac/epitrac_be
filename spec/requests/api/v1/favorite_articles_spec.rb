require 'rails_helper'

RSpec.describe 'endpoint to save an article to user dashboard' do 
  describe 'as a user when i visit the show articles endpoint an instance of favorite article is created' do 

    it 'creates a new instance of a favorite article with the attributes from the article', :vcr do 

      get "/api/v1/articles?disease=Anthrax"
      expect(response).to be_successful
      articles = JSON.parse(response.body, symbolize_names: true)[:data]
      article = articles[0]
      
      get "/api/v1/articles/8651?user_id=6"
    
      expect(response).to be_successful

      saved_article = FavoriteArticle.last 
      # require 'pry'; binding.pry

      expect(saved_article.author).to eq(article[:attributes][:author])
    end
  end

  describe 'an instance of favorite article can be deleted' do 
    it 'deletes a saved article from favorite articles table', :vcr do 
      FavoriteArticle.create!(id: 36, author: "hi", date: "hi", title: "Hi", year: "2023", isbn_issn: "1234", keywords: "hi", abstract: "hi", url: "hi", doi: "hi", article_id: "12", user_id: 1)

      delete "/api/v1/favorite_articles/36"

      saved_article = FavoriteArticle.last 
      expect(saved_article).to eq(nil)
    end
  end
end
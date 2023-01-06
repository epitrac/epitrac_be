require 'rails_helper'

RSpec.describe 'endpoint to save an article to user dashboard' do 
  describe 'as a user when i send a post request to /api/v1/favorite_articles' do 
    let(:headers) { { CONTENT_TYPE: 'application/json' } }

    it 'creates a new instance of a favorite article with the attributes from the article', :vcr do 

      get "/api/v1/articles?disease=Anthrax"
      expect(response).to be_successful
      articles = JSON.parse(response.body, symbolize_names: true)[:data]
      article = articles[0]
      user_id = "1" 
      
      post "/api/v1/favorite_articles", headers: headers, params: JSON.generate(article)
    
      expect(response).to be_successful


      saved_article = FavoriteArticle.last 
      require 'pry'; binding.pry

      expect(saved_article.author).to eq(article.author)
    end
  end
end
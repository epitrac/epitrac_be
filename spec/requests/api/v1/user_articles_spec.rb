require 'rails_helper'

RSpec.describe 'endpoint to save an article to user dashboard' do
  describe 'as user can save an article' do

    it 'creates and saves an instance of user article', :vcr do

      get "/api/v1/articles?disease=Anthrax"
      expect(response).to be_successful
      articles = JSON.parse(response.body, symbolize_names: true)[:data]
      article = articles[0]
      article_id = article[:attributes][:article_id]

      post "/api/v1/user_articles?user_id=2&article_id=#{article_id}"



      expect(response).to be_successful

      saved_article = UserArticle.last

      expect(saved_article.user_id).to eq(2)
      expect(saved_article.article_id).to eq(article_id.to_i)

    end
  end

  describe 'an instance of user article can be deleted' do
    it 'deletes a saved article from user articles table', :vcr do
      UserArticle.create!(user_id: 2, article_id: 25)
      saved_article = UserArticle.last
      expect(saved_article.user_id).to eq(2)
      # delete "/api/v1/user_articles/36?user_id=#{saved_article.user_id}&article_id=#{saved_article.article_id}"
      delete "/api/v1/user_articles/#{saved_article.id}"

      saved_article = UserArticle.last
      expect(saved_article).to eq(nil)
    end

    it 'an article cant be deleted if it doesnt exist' do
      delete "/api/v1/user_articles/10"
      expect(response).to have_http_status 404
      errors = JSON.parse(response.body, symbolize_names: true)
      expect(errors[:error]).to eq("no favorite article exists with that id")
    end

  end

  describe 'get all of a users saved articles' do
    it 'returns a list of that users saved articles', :vcr do
      article1= UserArticle.create!(user_id: 1, article_id: 3)
      article2= UserArticle.create!(user_id: 1, article_id: 4)
      article3= UserArticle.create!(user_id: 2, article_id: 3)

      expect(UserArticle.all.count).to eq(3)
      get "/api/v1/user_articles?user_id=1"
      expect(response).to be_successful
      saved_articles = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(saved_articles.count).to eq(2)
      expect(saved_articles.pluck(:id)).to eq([article1.article_id.to_s, article2.article_id.to_s])
      expect(saved_articles.pluck(:id)).to_not eq([article3.article_id.to_s])

    end

    it 'sad path, returns error without a user_id' do
      get "/api/v1/user_articles"
      expect(response).to have_http_status 404
      errors = JSON.parse(response.body, symbolize_names: true)
      expect(errors[:error]).to eq("cannot find saved articles without a user id")


    end
  end
end

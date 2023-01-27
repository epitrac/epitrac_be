require 'rails_helper'

RSpec.describe 'articles endpoint' do
  it 'returns articles that match the search criteria', :vcr do
    get "/api/v1/articles?disease=Anthrax"

    expect(response).to be_successful

    articles = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(articles[0]).to have_key(:id)
    expect(articles[0][:id]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:article_id)
    expect(articles[0][:attributes][:article_id]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:author)
    expect(articles[0][:attributes][:author]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:title)
    expect(articles[0][:attributes][:title]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:year)
    expect(articles[0][:attributes][:year]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:date)
    expect(articles[0][:attributes][:date]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:isbn_issn)
    expect(articles[0][:attributes][:isbn_issn]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:keywords)
    expect(articles[0][:attributes][:keywords]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:abstract)
    expect(articles[0][:attributes][:abstract]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:url)
    expect(articles[0][:attributes][:url]).to be_a(String)

    expect(articles[0][:attributes]).to have_key(:doi)
    expect(articles[0][:attributes][:doi]).to be_a(String)
  end
  it 'sad path testing, returns error without disease params', :vcr do 
    get "/api/v1/articles"
    expect(response).to have_http_status 404
    errors = JSON.parse(response.body, symbolize_names: true)
    expect(errors[:error]).to eq("cannot return articles without a disease")
  end

  it 'can delete all of a users saved articles', :vcr do 
    art1 = UserArticle.create!(user_id: 2, article_id: 25)
    art2 = UserArticle.create!(user_id: 2, article_id: 26)
    art3= UserArticle.create!(user_id: 2, article_id: 27)
    expect(UserArticle.where(user_id: 2)).to eq([art1, art2, art3])

    delete "/api/v1/articles/2"
    expect(UserArticle.where(user_id: 2)).to eq([])
    message = JSON.parse(response.body, symbolize_names: true)[:message]

    expect(message).to eq("All articles were deleted for this user")
  end

  it 'returns an error and status 404 if a user tries to delete all articles but there arent any', :vcr do 
    user_id = 3 
    delete "/api/v1/articles/3"
    expect(response).to have_http_status 404

    expect(UserArticle.where(user_id: 3)).to eq([])
    message = JSON.parse(response.body, symbolize_names: true)[:message]

    expect(message).to eq("There are no saved articles for this user")


  end

end
require 'rails_helper'

RSpec.describe 'articles endpoint' do
  it 'returns articles that match the search criteria', :vcr do
    get "/api/v1/articles?disease=Anthrax"

    expect(response).to be_successful

    articles = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(articles[0][:attributes]).to have_key(:id)
    expect(articles[0][:attributes][:id]).to be_a(String)

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
end
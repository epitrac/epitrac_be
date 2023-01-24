require 'rails_helper'

RSpec.describe ArticleFacade do

  it 'it creates an array of objects', :vcr do 
    articles = ArticleFacade.articles("anthrax")

    expect(articles).to be_an Array 
    expect(articles[0]).to be_an_instance_of(Article)
    expect(articles[0].title).to eq("Binding of the von Willebrand factor a domain of capillary morphogenesis protein 2 to anthrax protective antigen vaccine reduces immunogenicity in mice")
    expect(articles[0].title).to_not eq("Predicting hospital surge after a large-scale anthrax attack: a model-based analysis of CDC's cities readiness initiative prophylaxis recommendations")
    expect(articles[0].id).to eq("1076")
    expect(articles[0].doi).to eq("10.1128/mSphere.00556-19")
    expect(articles[0].author).to eq("de Oliveira, F. F. M. M., S.;Gonti, S.;Brey, R. N.;Li, H.;Schiffer, J.;Casadevall, A.;Bann, J. G.")
  end

  it 'returns an empty array if disease has no articles', :vcr do 
    articles = ArticleFacade.articles("hansen's")
    expect(articles).to eq([])
  end
end
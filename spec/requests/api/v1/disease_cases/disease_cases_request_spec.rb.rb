require 'rails_helper' 

RSpec.describe 'DiseaseCases index api requests with state query param' do 
  xdescribe '/api/v1/disease_cases?state=GEORGIA' do 
    get '/api/v1/disease_cases?state=GEORGIA' 
  end
end
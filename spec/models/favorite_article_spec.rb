require 'rails_helper' 

RSpec.describe FavoriteArticle, type: :model do 
  describe 'validations' do 
    it { should validate_presence_of :author }
    it { should validate_presence_of :title }
    it { should validate_presence_of :year }
    it { should validate_presence_of :date }
    it { should validate_presence_of :isbn_issn }
    it { should validate_presence_of :keywords }
    it { should validate_presence_of :abstract }
    it { should validate_presence_of :url }
    it { should validate_presence_of :doi }
    it { should validate_presence_of :article_id }

  end
end
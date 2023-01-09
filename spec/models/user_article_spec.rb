require 'rails_helper'

RSpec.describe UserArticle, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :article_id }
  end
end

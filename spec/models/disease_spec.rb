require 'rails_helper'

RSpec.describe Disease, type: :model do
  describe 'validations' do
    it { should validate_presence_of :disease }
    it { should validate_presence_of :information }
    it { should validate_presence_of :link }
  end
end
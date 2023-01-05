require 'rails_helper'

RSpec.describe DiseaseCaseService do
  describe 'class methods', :vcr do
    describe '#all_states_cases' do
      it 'returns all states disease case data' do
        cases = DiseaseCaseService.all_states_cases

        expect(cases).to be_a(Array)
        expect(cases[0]).to be_a(Hash)
        case1 = cases[0]

        expect(case1).to have_key(:states)
        expect(case1[:states]).to be_a(String)

        expect(case1).to have_key(:year)
        expect(case1[:year]).to be_a(String)

        expect(case1).to have_key(:week)
        expect(case1[:week]).to be_a(String)
      end
    end
  end
end
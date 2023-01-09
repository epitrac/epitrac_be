FactoryBot.define do
  factory :disease do
    disease { Faker::Lorem.word }
    information { Faker::Lorem.paragraph(sentence_count: 2) }
    link { Faker::Internet.url }
    short_name { Faker::Lorem.word }
  end
end
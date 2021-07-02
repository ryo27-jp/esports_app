FactoryBot.define do
  factory :team do
    name { Faker::Book.title }
    about { 'チームについて書くところです。' }
  end
end

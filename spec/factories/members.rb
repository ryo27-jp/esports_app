FactoryBot.define do
  factory :member do
    name { 'テスト名前' }
    url { 'https://twitter.com/' }
    biography { 'テストだよ' }
    division
  end
end

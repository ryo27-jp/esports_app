FactoryBot.define do
  factory :division do
    name { 'test部門' }
    description { '部門について書くところです。' }
    team
  end
end

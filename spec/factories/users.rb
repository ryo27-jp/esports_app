FactoryBot.define do
  factory :user do
    sequence(:email) { 'test1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    roll { 1 }
  end
end

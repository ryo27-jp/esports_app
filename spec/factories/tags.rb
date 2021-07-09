FactoryBot.define do
  factory :tag do
    title { Faker::Games::LeagueOfLegends.summoner_spell }
  end
end

20.times do |n|
  team = Team.create(name: Faker::Game.title,
                     about: Faker::Game.genre)

  team.image.attach(
    io: File.open('db/fixtures/犬.jpg'),
    filename: '犬.jpg'
  )

  division = Division.create(name: Faker::Sports::Football.team,
                  description: Faker::Sports::Football.coach,
                  team_id: team.id  )

  Member.create(name: Faker::Music::Hiphop.artist,
                url: "https://google.com/#{n}",
                biography: Faker::Music::Hiphop.subgenres,
                division_id: division.id  )
                
end

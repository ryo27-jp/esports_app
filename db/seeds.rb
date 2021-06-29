20.times do
  team = Team.create(name: Faker::Game.title,
                     about: Faker::Game.genre)

  team.image.attach(
    io: File.open('db/fixtures/犬.jpg'),
    filename: '犬.jpg'
  )
end

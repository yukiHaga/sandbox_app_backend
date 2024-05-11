5.times do
  Team.seed(
    {
      name: Faker::Name.unique.first_name,
    }
  )
end

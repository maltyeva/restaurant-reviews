Restaurant.destroy_all if Rails.env.development?


20.times do
  r =  Restaurant.create!(name: Faker::Hipster.word,
                          address: Faker::Address.street_address,
                          stars: rand(1..5),
                          chef: Faker::TvShows::StarTrek.character )
  p "Created #{r.name}"
end

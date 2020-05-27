puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
20.times do
  r = Restaurant.create!(name: Faker::Hipster.word,
                         address: Faker::Address.street_address,
                         description: Faker::Dessert.variety,
                         stars: rand(1..5),
                         chef_name: Faker::TvShows::StarTrek.character )
  rand(1..5).times do
    Review.create!(content: Faker::TvShows::RickAndMorty.quote,
                   restaurant_id: r.id)
  end
end

# 20.times do
#   Review.create!(content: Faker::TvShows::RickAndMorty.quote,
#                  restaurant: Restaurant.all.sample)
# end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Tags
tag = {}
ActiveRecord::Base.transaction do
	20.times do
		tag['name'] = Faker::Hipster.word.titleize
		Tag.create(tag)
	end
end

# Seed Users
user = {}
user['password'] = 'asdfgh'

ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['handle'] = Faker::Internet.username(user['first_name'])
    user['email'] = Faker::Internet.email
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = [*1..11]
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['name'] = Faker::App.name
    # listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['num_bedroom'] = rand(1..5)
    listing['num_bed'] = rand(1..6)
    listing['num_bathroom'] = rand(0..6)
    listing['max_guests'] = rand(1..10)
    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence
    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end


#Seed Taggings
tagging = {}

ActiveRecord::Base.transaction do
	3.times do 
		Listing.all.each do |list|
			tagging['listing_id'] = list.id
			tagging['tag_id'] = rand(1..30)
			Tagging.create(tagging)
		end
	end
end
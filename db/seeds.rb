# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

city_array =[]
user_array =[]
tag_array =[]
gossip_array =[]

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
City.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities')
Gossip.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('gossips')
Tag.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('tags')
PrivateMessage.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('privatemessages')


10.times do
  city = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip
  )
  city_array << city
end

puts "10 villes créées"

10.times do
  ages = rand (20..35)
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 10),
    age: ages,
    email: Faker::Internet.email,
    city:city_array.sample
  )
  user_array << user
end

puts "10 users créés"

10.times do
  tag = Tag.create!(
    title: Faker::Lorem.sentence(word_count: 1)
  )
  tag_array << tag
end

puts "10 tags créés"

20.times do
  gossip = Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 2),
    content: Faker::Lorem.sentence(word_count: 15),
    user:user_array.sample,
    publication_date: Faker::Date.backward(days: 30),
    tags:tag_array.sample(rand(1..3)),
    like_count: 0,
    city:city_array.sample
  )
  gossip_array << gossip
end

puts "20 auteurs créé"

5.times do
  privatemessage = PrivateMessage.create!(
    content: Faker::Lorem.sentence(word_count: 15),
    user:user_array.sample
  )
end

puts "J'ai pas réussi à faire les messages privés ouin ouin!"

20.times do 
  comment = Comment.create!(
    content: Faker::Lorem.sentence(word_count: 15),
    user:user_array.sample,
    gossip:gossip_array.sample
  )
end

puts "20 coms créés"

#20.times do
  #if [true, false].sample
    #like = Like.create!(
      #likeable_type: "Gossip",
      #likeable_id: gossip_array.sample.id
    #)
  #else
    #like = Like.create!(
      #likeable_type: "Comment",
      #likeable_id: gossip_array.sample.id
    #)
  #end
#end

puts "<3 sur toi XD"
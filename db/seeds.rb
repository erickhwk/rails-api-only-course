# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# #############################################################
# Populate category table

puts 'Creating categories...'

categories = %w[friend colleague family comercial]

categories.each do |category|
  Category.create!(
    description: category
  )
end
puts 'Categories created sucessfully!'

#############################################################
# Populate Contact table
puts 'Creating contacts...'

100.times do
  Contact.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    birthdate: Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
    category: Category.all.sample
  )
end

puts 'Contacts created sucessfully!'

#############################################################
# Populate phone table
puts 'Creating phone numbers...'

Contact.all.each do |contact|
  Random.rand(1..5).times do
    phone = Phone.create!(
      number: Faker::PhoneNumber.cell_phone,
      contact_id: contact.id
    )
    contact.phones << phone
    contact.save!
  end
end

puts 'Phone numbers created sucessfully!'

#############################################################
# Populate address table
puts 'Creating Addresses...'

Contact.all.each do |contact|
  Address.create!(
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    contact_id: contact.id
  )
  contact.address = address
  contact.save!
end

puts 'Addresses created sucessfully!'

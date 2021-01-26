# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Ingredient.destroy_all

request_uri = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
request_query = ''
url = "#{request_uri}#{request_query}"

buffer = open(url).read
result = JSON.parse(buffer)

list = result['drinks']

list.first(20).each do |hash|
  ingredient = Ingredient.create(name: hash['strIngredient1'])
  puts "Created #{ingredient.name}"
end

puts 'Finished!'

puts 'Cleaning database...'
Cocktail.destroy_all

puts 'Creating cocktails...'
mojito = { name: 'mojito' }
cuba_libre = { name: 'cuba_libre' }
caipi = { name: 'caipi' }
yagger_bomb = { name: 'yagger bomb' }

[mojito, cuba_libre, caipi, yagger_bomb].each do |element|
  cocktail = Cocktail.create!(element)
  puts "Created #{cocktail.name}"
end
puts 'Finished!'

puts 'Cleaning database...'

puts 'Creating doses...'
basilic = { description: '2 slice', cocktail: Cocktail.all[0], ingredient: Ingredient.all[0] }
cl = { description: '2 cl de cuillere a café', cocktail: Cocktail.all[1], ingredient: Ingredient.all[1] }
ml = { description: '50 ml cuillere a soupe', cocktail: Cocktail.all[2], ingredient: Ingredient.all[2] }
ice = { description: '3 round ice', cocktail: Cocktail.all[3], ingredient: Ingredient.all[3] }

[cl, ml, ice, basilic].each do |add|
  dose = Dose.create!(add)
  puts "Created #{dose.cocktail.name}, #{dose.description}, #{dose.ingredient.name}"
end
puts 'Finished!'

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
# https://github.com/flori/json
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

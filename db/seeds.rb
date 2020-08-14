# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

require 'open-uri'
require 'json'
def api_call()
    url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
    ingredient = open(url).read
    return JSON.parse(ingredient)
end
puts "Creating Ingredient List"
api_call["drinks"].each do |single|
    ing = single.values[0]
 @ingredient = Ingredient.new(name: ing)
 @ingredient.save
end
puts "Ingredient list created"
# puts "Creating Cocktail List"
# ### example seeds ###
# bd = {name: "Bloody Mary"}
# ng = {name: "Negroni"}
# co = {name: "Cosmopolitan"}
# sf = {name: "Suffering Bastard"}
# wr = {name: "White Russian"}
# cocktail = Cocktail.new(bd)
# file = URI.open("https://source.unsplash.com/900x900/?#{cocktail.name}")
# cocktail.photo.attach(io: file, filename: 'bd.jpg', content_type: 'image/jpg')
# cocktail.save
# cocktail = Cocktail.new(ng)
# cocktail.save
# cocktail = Cocktail.new(co)
# file = URI.open("https://source.unsplash.com/900x900/?#{cocktail.name}")
# cocktail.photo.attach(io: file, filename: 'co.jpg', content_type: 'image/jpg')
# cocktail.save
# cocktail = Cocktail.new(sf)
# file = URI.open("https://source.unsplash.com/900x900/?#{cocktail.name}")
# cocktail.photo.attach(io: file, filename: 'sf.jpg', content_type: 'image/jpg')
# cocktail.save
# cocktail = Cocktail.new(wr)
# file = URI.open("https://source.unsplash.com/900x900/?#{cocktail.name}")
# cocktail.photo.attach(io: file, filename: 'wr.jpg', content_type: 'image/jpg')
# cocktail.save






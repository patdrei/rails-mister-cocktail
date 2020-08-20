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
puts "Creating Cocktail List"
### example seeds ###
bd = {name: "Bloody Mary", description: "For I am a sinner in the hands of an angry god. Bloody Mary, full of vodka, blessed are you among cocktails. Pray for me now, at the hour of my death, which I hope is soon."}
ng = {name: "Negroni", description: "Easy to make and refreshingly bitter, the Negroni is said to have been invented in Florence by a dauntless Italian count who demanded that the bartender replace the club soda in his Americano with gin. It was a substitution that launched a thousand riffs."}
co = {name: "Cosmopolitan", description: "The legendary Cosmopolitan is a simple cocktail with a big history. It reached its height of popularity in the 1990s, when the HBO show 'Sex and the City' was at its peak. The pink-hued Martini was a favorite of the characters on the show."}
sf = {name: "Suffering Bastard", description: "So many classic cocktails are born in the bars of great hotels. Originally conceived as a hangover cure by the bar staff at Cairo's Shepherd's Hotel (before it burned to the ground in 1952), this bourbon- and gin-based drink has been around for 70 years."}
wr = {name: "White Russian", description: "The White Russian is both decadent and easy to make. Combining vodka, Kahlúa and cream and serving it on the rocks create a delicious alternative to adult milkshakes."}
cocktail = Cocktail.new(bd)
file = URI.open("https://source.unsplash.com/900x900/?#{cocktail.name}")
cocktail.photo.attach(io: file, filename: 'bd.jpg', content_type: 'image/jpg')
cocktail.save
cocktail = Cocktail.new(ng)
cocktail.save
cocktail = Cocktail.new(co)
file = URI.open("https://source.unsplash.com/900x900/?#{cocktail.name}")
cocktail.photo.attach(io: file, filename: 'co.jpg', content_type: 'image/jpg')
cocktail.save
cocktail = Cocktail.new(sf)
file = URI.open("https://source.unsplash.com/900x900/?#{cocktail.name}")
cocktail.photo.attach(io: file, filename: 'sf.jpg', content_type: 'image/jpg')
cocktail.save
cocktail = Cocktail.new(wr)
file = URI.open("https://source.unsplash.com/900x900/?#{cocktail.name}")
cocktail.photo.attach(io: file, filename: 'wr.jpg', content_type: 'image/jpg')
cocktail.save






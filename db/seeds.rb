# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting everything 😈 ..."

Dose.delete_all
Cocktail.delete_all
Ingredient.delete_all

puts "Aaand creating stuff ..."

20.times do
  Ingredient.create(name: Faker::Food.ingredient)
end

15.times do
  Cocktail.create(name: Faker::Book.title)
end

cocktails = Cocktail.all
ingredients = Ingredient.all


cocktails.each do |cocktail|
  15.times do
    dose = Dose.new(description: "#{Faker::Number.non_zero_digit} #{Faker::File.extension}")
    dose.cocktail = cocktail
    ingredient = ingredients.sample
    dose.ingredient = ingredient
    dose.save
    puts dose
  end
end

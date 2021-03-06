# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username:  "succli",
             email: "succ92@gmail.com",
             password:              "navista123",
             password_confirmation: "navista123",
             firstname: 'Zsolt',
             lastname: 'Schutzbach',
             description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
             admin:     true)

55.times do |n|
  password = Faker::Internet.password(6, 20, true)
  User.create!(username:  Faker::Internet.unique.user_name(6..20),
              email: Faker::Internet.unique.email,
              password:              password,
              password_confirmation: password,
              firstname: Faker::Name.first_name,
              lastname: Faker::Name.last_name,
              description: Faker::Lorem.paragraph(3),
              admin: false)
end

20.times do |n|
  Post.create!(title: Faker::Lorem.paragraph(1),
             content: Faker::Lorem.paragraph(10),
             user_id: 1)
end

RecipeCategory.create!(name: "Előételek")
RecipeCategory.create!(name: "Főételek")
RecipeCategory.create!(name: "Desszertek")
RecipeCategory.create!(name: "Levesek")
RecipeCategory.create!(name: "Saláták")
RecipeCategory.create!(name: "Sütemények")
RecipeCategory.create!(name: "Édes sütemények")
RecipeCategory.create!(name: "Sós sütemények")
RecipeCategory.create!(name: "Egytálételek")
RecipeCategory.create!(name: "Torták")
RecipeCategory.create!(name: "Húsételek")
RecipeCategory.create!(name: "Főzelékek")
RecipeCategory.create!(name: "Tészták")
RecipeCategory.create!(name: "Apró sütemények")
RecipeCategory.create!(name: "Pizza")
RecipeCategory.create!(name: "Lekvárok/Dzsemek")
RecipeCategory.create!(name: "Halételek")
RecipeCategory.create!(name: "Szendvicsek")
RecipeCategory.create!(name: "Szószok")
RecipeCategory.create!(name: "Fagyi")
RecipeCategory.create!(name: "Italok")
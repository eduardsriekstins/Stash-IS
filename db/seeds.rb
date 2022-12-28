# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(full_name: 'Eduards Riekstins', email: 'eduardsriekstins@gmail.com', password: 'Eduards01!', password_confirmation: 'Eduards01!', role: User.roles[:admin])
User.create(full_name: 'Tester One', email: 'tester@test.com', password: 'password', password_confirmation: 'password')

1.times do |x|
  Post.create(title: "First post", body: "This is the first post in this System!", user_id: User.first.id)
  Project.create(name: "First project", description: "This is the first project in this System!", user_id: User.first.id)
  Task.create(name: "First task", description: "This is the first task in this System!", status: "to do", project_id: Project.first.id, user_id: User.first.id)
end
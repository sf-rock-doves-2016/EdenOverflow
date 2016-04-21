require 'Faker'

20.times.map do
  User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "1234")
end




User.create(username: "Eric Dell'Aringa", email: "edella2@gmail.com", password: "1234")

Question.create(title: "Basic Crud template made for DBC students", body: "Feel free to add to this as you will.  This is a skeleton that you can use on most CRUD apps. There are helper methods written in this as well to make checking which user is currently logged in, if the user should have access to edit/delete a post etc.  Message me on slack or email if you have questions", user_id: 21, created_at: "Tue, 15 Dec 2015 15:06:29 -0800")


require 'Faker'

20.times.map do
  User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "123456789")
end


User.create(username: "Eric Dell'Aringa", email: "edella2@gmail.com", password: "123456789")

Question.create(title: "Basic Crud template made for DBC students", body: "Feel free to add to this as you will.  This is a skeleton that you can use on most CRUD apps. There are helper methods written in this as well to make checking which user is currently logged in, if the user should have access to edit/delete a post etc.  Message me on slack or email if you have questions", user_id: 21)


#Examples to traverse of DB

# Question.first.answers.create()

#Total number of votes
# Vote.where(votable_id: 1, votable_type: "Question").count

#Overall vote count
# Vote.where(votable_id: 1, votable_type: "Question").sum(:count)

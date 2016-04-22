require 'Faker'
require 'schwarzefaker'

20.times.map do
  User.create!(username: Arnold.villain, email: Faker::Internet.email, password: "1234")
end


User.create(username: "EricDellAri", email: "edella2@gmail.com", password: "1234")

Question.create(title: "Basic Crud template made for DBC students", body: "Feel free to add to this as you will.  This is a skeleton that you can use on most CRUD apps. There are helper methods written in this as well to make checking which user is currently logged in, if the user should have access to edit/delete a post etc.  Message me on slack or email if you have questions", user_id: 21)

20.times.map do
  Question.create!(title: Arnold.movie, body: Arnold.quote, user_id: rand(1..User.all.length))
end

60.times.map do
  Answer.create!(body: Arnold.quote, user_id: rand(1..User.all.length), question_id: rand(1..Question.all.length))
end

60.times.map do
  Comment.create!(body: Arnold.quote, user_id: rand(1..User.all.length), commentable_id: rand(1..60), commentable_type: "Answer")
end

60.times.map do
Comment.create!(body: Arnold.quote, user_id: rand(1..User.all.length), commentable_id: rand(1..20), commentable_type: "Question")
end

80.times.map do
  Vote.create!(user_id: rand(1..User.all.length), votable_id: rand(1..Question.all.length), votable_type: "Question" , count: 1)
end

80.times.map do
  Vote.create!(user_id: rand(1..User.all.length), votable_id: rand(1..Answer.all.length), votable_type: "Answer" , count: 1)
end


#Examples to traverse of DB

# Question.first.answers.create()

#Total number of votes
# Vote.where(votable_id: 1, votable_type: "Question").count

#Overall vote count
# Vote.where(votable_id: 1, votable_type: "Question").sum(:count)

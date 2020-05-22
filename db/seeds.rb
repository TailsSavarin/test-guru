# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create!(email: 'admin@admin.com', password: '123456', first_name: 'Admin', last_name: 'Admin')

categories = Category.create!([{title: 'Backend'}, {title: 'Frontend'}])

tests = Test.create!([
  {title: 'Test1', level: 0, category_id: categories[0].id, user_id: admin.id},
  {title: 'Test2', level: 0, category_id: categories[0].id, user_id: admin.id},
  {title: 'Test3', level: 1, category_id: categories[1].id, user_id: admin.id},
  {title: 'Test4', level: 1, category_id: categories[1].id, user_id: admin.id},
  {title: 'Test5', level: 2, category_id: categories[0].id, user_id: admin.id}
])

questions = Question.create!([
  {body: '1', test_id: tests[0].id},
  {body: '1', test_id: tests[0].id},
  {body: '1', test_id: tests[1].id},
  {body: '1', test_id: tests[2].id},
  {body: '1', test_id: tests[3].id},
  {body: '1', test_id: tests[4].id}
])

Answer.create!([
  {body: '1', correct: false, question_id: questions[0].id},
  {body: '1', correct: false, question_id: questions[1].id},
  {body: '1', correct: false, question_id: questions[2].id},
  {body: '1', correct: false, question_id: questions[3].id},
  {body: '1', correct: false, question_id: questions[4].id},
  {body: '1', correct: false, question_id: questions[5].id},
])

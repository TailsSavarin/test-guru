# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Database' }])

tests = Test.create!([
  { category_id: categories[0].id, title: 'Ruby', level: 3 },
  { category_id: categories[1].id, title: 'React', level: 1 },
  { category_id: categories[2].id, title: 'Postgresql', level: 2 }
])

questions = Question.create!([
  { test_id: tests[0].id, body: 'Ruby is agile language?' },
  { test_id: tests[1].id, body: 'At what point in the life cycle do you apply AJAX?' },
  { test_id: tests[2].id, body: 'Alias for data type: integer?' }
])

answers = Answer.create!([
  { question_id: questions[0].id, body: 'Yes', correct: true },
  { question_id: questions[0].id, body: 'No', correct: false},
  { question_id: questions[1].id, body: 'componentDidMount', correct: true },
  { question_id: questions[2].id, body: 'int', correct: true },
  { question_id: questions[2].id, body: 'int4', correct: true }
])

users = User.create!([{ name: 'Tom' }, { name: 'Sam' }, { name: 'Ted' }])

passed_tests = PassedTest.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[1].id, test_id: tests[1].id },
  { user_id: users[2].id, test_id: tests[2].id }
])

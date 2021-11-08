# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all


u1 = User.create(username: "Jack Burton")
u2 = User.create(username: "Gracy Law")
u3 = User.create(username: "Lo Pan")
u4 = User.create(username: "The Thing")
u5 = User.create(username: "Howard Beale")
u6 = User.create(username: "Alan Grant")
u7 = User.create(username: "Mr. Pink")
u8 = User.create(username: "Mr. White")
u9 = User.create(username: "Mr. Orange")
u10 = User.create(username: "Mr. Yellow")
u11 = User.create(username: "Mr. Blue")
u12 = User.create(username: "Dr. Acula")

p1 = Poll.create(title: "Heroes and Villains", author_id: u3.id)
p2 = Poll.create(title: "Crime and Punishment", author_id: u7.id)
p3 = Poll.create(title: "The Unknown and Unknowable", author_id: u12.id)

q1 = Question.create(question: "Who is the *real* villain here?", poll_id: p1.id)
q2 = Question.create(question: "If my actions are pre-written, can they be 'wrong'?", poll_id: p1.id)
q3 = Question.create(question: "How many guns are too many for one standoff?", poll_id: p2.id)
q4 = Question.create(question: "ACAB?", poll_id: p2.id)
q5 = Question.create(question: "If you were granted Sight, would you still wish to see?", poll_id: p3.id)
q6 = Question.create(question: "What lies beyond the shroud of death?", poll_id: p3.id)

a1 = AnswerChoice.create(choice: "The guy trying to rule the world", question_id: q1.id)
a2 = AnswerChoice.create(choice: "The people who simply will not mind their own business", question_id: q1.id)
a3 = AnswerChoice.create(choice: "Eh, I guess not", question_id: q2.id)
a4 = AnswerChoice.create(choice: "Definitely", question_id: q2.id)
a5 = AnswerChoice.create(choice: "I think three is about the max", question_id: q3.id)
a6 = AnswerChoice.create(choice: "Can't have too many guns in a standoff, look at Butch and Sundance", question_id: q3.id)
a7 = AnswerChoice.create(choice: "Yes", question_id: q4.id)
a8 = AnswerChoice.create(choice: "Definitely yes", question_id: q4.id)
a9 = AnswerChoice.create(choice: "Sure, why not", question_id: q5.id)
a10 = AnswerChoice.create(choice: "I don't think that's a great idea", question_id: q5.id)
a11 = AnswerChoice.create(choice: "Only Nothing", question_id: q6.id)
a12 = AnswerChoice.create(choice: "Only Everything", question_id: q6.id)
a13 = AnswerChoice.create(choice: "Nice cape, dork", question_id: q6.id)

Response.create(user_id: u1.id, choice_id: a1.id)
Response.create(user_id: u2.id, choice_id: a1.id)
Response.create(user_id: u3.id, choice_id: a2.id)
Response.create(user_id: u12.id, choice_id: a12.id)
Response.create(user_id: u6.id, choice_id: a11.id)
Response.create(user_id: u7.id, choice_id: a13.id)
Response.create(user_id: u5.id, choice_id: a8.id)
Response.create(user_id: u8.id, choice_id: a7.id)





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# user creation
u = User.create name: "Arto", password: "ratebeeR123", password_confirmation: "ratebeeR123", email: "trolol@yay.lol"
Maija = User.create name: "Maija", password: "ratebeeR123", password_confirmation: "ratebeeR123", email: "viichet@omg.lol"
pauli = User.create name: "pauli", password: "pauli123", password_confirmation: "pauli123", email: "example@example.org"

# survey creation
s = u.surveys.create title: "Linis 1", status: "Unpublished"
s2 = Maija.surveys.create title: "Linis 2", status: "Unpublished"
u.surveys.create title: "LaMa", status: "Published"
u.surveys.create title: "Lapio", status: "Finished"

# radio question and options 
q = s.questions.create title: "Kuka?", kind: "Radiobutton"
q.options.create value: "Heikki"
q.options.create value: "Risto"
q.options.create value: "Joku muu"

# check question and options 
q = s.questions.create title: "Mikä?", kind: "Checkbox"
q.options.create value: "Myyrä"
q.options.create value: "Näätä"
q.options.create value: "Siiseli"

# text question without options
q = s.questions.create title: "Missä?", kind: "Textfield"

# tags 
Survey.first.tags.create title: "Linis2013"
Survey.first.tags.create title: "Matematiikka"

# response to a survey
r = Response.create survey: s 
r.answers.create option_id: 1,response_id: 1, question_id: 1
r.answers.create option_id: 2,response_id: 3, question_id: 1
r.answers.create option_id: 3,response_id: 4, question_id: 1

# another response to a survey
r2 = Response.create survey: s2 
r2.answers.create option_id: 1, question_id: 1
r2.answers.create option_id: 1, question_id: 2

r3 = Response.create survey: s 
r3.answers.create option_id: 2, response_id: 3, question_id: 1

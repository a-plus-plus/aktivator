# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


#luodaan käyttäjä
u = User.create name: "Arto", password: "ratebeeR123", password_confirmation: "ratebeeR123"
Maija = User.create name: "Maija", password: "ratebeeR123", password_confirmation: "ratebeeR123"


#luodaan surveyt
s = u.surveys.create title: "Linis 1", status: "Unpublished"
s2 = Maija.surveys.create title: "Linis 2", status: "Unpublished"
u.surveys.create title: "LaMa", status: "Published"
u.surveys.create title: "Lapio", status: "Finished"

#luodaan ensimmäinen kysymys ja vaihtoehdot siihen
q = s.questions.create title: "Kcreateuka?", kind: "Radiobutton"
q.options.create value: "Heikki"
q.options.create value: "Risto"
q.options.create value: "Joku muu"
#luodaan toinen kysymys ja vaihtoehdot siihen
q = s.questions.create title: "Mikä?", kind: "Checkbox"
q.options.create value: "Myyrä"
q.options.create value: "Näätä"
q.options.create value: "Siiseli"

#luodaan kolmas kysymys 
q = s.questions.create title: "Missä?", kind: "Textfield"

#luodaan vastaukset ensimmäiseen.saven survey:hin
r = Response.create survey: s 
r.answers.create value: "Heikki",response_id: 1, question_id: 1
r.answers.create value: "Heikki",response_id: 2, question_id: 1
r.answers.create value: "Risto",response_id: 3, question_id: 1
r.answers.create value: "Joku muu",response_id: 4, question_id: 1


r2 = Response.create survey: s2 
r2.answers.create value: "Heikki", question_id: 1
r2.answers.create value: "Myyrä", question_id: 2

r3 = Response.create survey: s 
r3.answers.create value: "Risto", response_id: 3, question_id: 1
#Survey.create([{ title: 'Äärettömän monta ratkaisua' ,status:'Finished'},{ title: 'Porrasmatriisit',status:'Published'},{ title: 'Sidottu',status:'Unpublished'},{ title: 'Redusoidut porrasmatriisit',status:'Finished'},{ title: 'Virittämisväitteet',status:'Published'},{ title: 'Onko R^2 avaruuden R^3 aliavaruus?',status:'Finished'},{ title: 'Matriisiväitteet',status:'Unpublished'},{ title: 'Vapauskysymys',status:'Published'}])
##questions
#Question.create([{ title: 'en tiedä ',survey_id: 1, kind: 'Radiobutton'}])
#Question.create([{ title: 'muu vastaus ',survey_id: 1, kind: 'Radiobutton'}])
#Question.create([{ title: ' A ja B',survey_id: 1, kind: 'Radiobutton'}])

#Question.create([{ title: 'En tiedä',survey_id: 6, kind: 'Radiobutton'}])
#Question.create([{ title: 'Ei',survey_id: 6, kind: 'Radiobutton'}])
#Question.create([{ title: 'Kyllä',survey_id: 6, kind: 'Radiobutton'}])

#Question.create([{ title: 'Tiedän',survey_id: 7, kind: 'Checkbox'}])
#Question.create([{ title: 'En tiedä',survey_id: 7, kind: 'Checkbox'}])
#Question.create([{ title: 'A',survey_id: 7, kind: 'Radiobutton'}])
#Question.create([{ title: 'B',survey_id: 7, kind: 'Radiobutton'}])
#Question.create([{ title: 'Molemmat',survey_id: 7, kind: 'Radiobutton'}])

#Question.create([{ title: 'En tiedä',survey_id: 8, kind: 'Radiobutton'}])
#Question.create([{ title: 'Olen samaa mieltä',survey_id: 8, kind: 'Radiobutton'}])
#Question.create([{ title: 'Vihje:ajattele eri vapausasteita',survey_id: 8, kind: 'Textfield'}])

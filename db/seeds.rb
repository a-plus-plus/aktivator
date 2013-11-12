# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

u = User.create name: "Arto", password: "ratebeeR123", password_confirmation: "ratebeeR123"

s = u.surveys.create title: "Linis 1", status: "Unpublished"
u.surveys.create title: "Linis 2", status: "Unpublished"
u.surveys.create title: "LaMa", status: "Published"
u.surveys.create title: "Lapio", status: "Finished"

q = s.questions.create title: "Kuka?", kind: "Radiobutton"
q.options.create value: "Heikki"
q.options.create value: "Risto"
q.options.create value: "Joku muu"

q = s.questions.create title: "Mikä?", kind: "Checkbox"
q.options.create value: "Myyrä"
q.options.create value: "Näätä"
q.options.create value: "Siiseli"

q = s.questions.create title: "Missä?", kind: "Textfield"

t = Tag.create title: "Linis2013"
Survey.first.tags << t
t = Tag.create title: "Matematiikka"
Survey.first.tags << t



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

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.create name: "Matti", password: "ratebeer"

s = u.surveys.create title: "Linis 1", status: "Unpublished"
u.surveys.create title: "Linis 2", status: "Unpublished"
u.surveys.create title: "LaMa", status: "Published"
u.surveys.create title: "Lapio", status: "Finished"

q = s.questions.create title: "Kuka?", kind: "Radiobutton"
s.questions.create title: "Mikä?", kind: "Checkbox"
s.questions.create title: "Missä?", kind: "Textfield"

q.options.create value: "Minä"
q.options.create value: "joku muu"
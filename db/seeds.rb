# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
roles     = ['citizen', 'local government', 'national government', 'private sector']
usernames = ['citizen', 'BrgyCuliat', 'DPWH', 'Meralco']
roles.each_with_index do |r, indx|
  email = r.gsub(' ', '_') + '@localhost.loc'
  User.create!(email: email, username: usernames[indx], password: 'secret123', password_confirmation: 'secret123', role: r)
end
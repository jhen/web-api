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


restaurants = [
  ['Burger King', 'First Floor, Tower 1, Makati Medical Center, Legaspi Village, Makati City'],
  ["McDonald's", "Ground Floor, Aegis People's Support Building, Gil Puyat Corner Ayala Avenue, Legaspi Village, Makati City"],
  ['KFC', 'Dela Rosa Car Park 2, Dela Rosa Street, Legaspi Village, Makati City'],
  ['Pizza Hut', 'First Floor, Tower 1, Makati Medical Center, Legaspi Village, Makati City'],
  ["Domino's Pizza", 'Marvin Plaza, Chino Roces Avenue, Legaspi Village, Makati City'],
  ['Jollibee', 'Ground Floor, Makati Cinema Square, Legaspi Village, Makati City'],
  ['Hungry Jack', 'Ground Floor, Makati Cinema Square, Legaspi Village, Makati City']
]

restaurants.each do |r|
  Restaurant.create!(name: r[0], address: r[1])
end


taglines = [
  ['KFC', 'Chicken is greasy, and you will lick your fingers like a hillbilly'],
  ['KFC', 'There’s Fast Food..Then There’s KFC!'],
  ['Burger King', 'It takes two hands to hold a Whopper'],
  ['Burger King', 'Have it your way, if "your way" means us not putting lettuce on it and charging you the same, and great if that\'s adds some dignity and semblance of control to your sad little life.'],
  ['McDonalds', "Pay day... why so long.. Ok Just eat at McDonalds, anyway you're familiar with it."],
  ['McDonalds', "You deserve a break today... so get up and get away... to McDonald’s...They do it all for you!"],
  ['Dairy Queen', 'They treat you like a person who will exchange money for goods.'],
  ['IHOP', "Come hungry, leave regretful, but still a little high."],
  ["'Papa John's", "They have the ingredients with which we can make you a pizza."],
  ["Domino’s", "Because you feel lazy, try out Domino's, The Pizza Delivery Experts'"],
  ["Allano's'", "Life is Too Short For Average Food!"],
  ['Pizza', "They're making it great again and again, so try it again and again"],
  ["Wendy's'", "You've eaten too much of fast food, IT’S WAY BETTER THAN FAST FOOD. IT’S WENDY’S."],
  ["Arby's'", "Coz you're' thinking different, think Arby's."],
  ["Burger King", "Eat as if you're a king"],
  ["Friday's", "I know it's not Friday, is it? Anyway, in here, it's always Friday'"],
  ["Friday's", "Devour the night! Feast on! Anyway it's pay day!"],
  ["Chipotle Mexican Grill", "Coz you're the man with integrity, your deserve the food with integrity"],
  ["Dairy Queen", "So Good It's RiDQulous"],
  ["McDonalds", "I know you love it"],
  ["Taco Bell", "Sometimes, you have to think outside the bun"],
  ["Hungry Jack", "Hungryyyyy??? Hungry Jack. They gobble ‘em up and the plate come back for Hungry Jack"],
  ["Jollibee", "You should eat here because you are broke meh :-("],
]

taglines.each_with_index do |t|
  addrs = 'Ground Floor, Makati Cinema Square, Legaspi Village, Makati City'
  r = Restaurant.where(name: t[0]).first
  r = Restaurant.create!(name: t[0], address: addrs) if r.blank?
  Tagline.create!(restaurant_id: r.id, tagline: t[1])
end

rs = Restaurant.where(longitude: nil, latitude: nil)
lat = '14.554729'
long = '121.0244452'
rs.each do |r|
  r.update_attributes(longitude: long, latitude: lat)
end


APP_KEY     = 'uctqfmaqilqx6w2lfxpnmujmxardywln'
APP_SECRET  = '9vmzk9kvaziqoka0cto5terklmoa5fyg'
API_SCOPES  = ''
curl "https://api.att.com/oauth/v4/token" \
    --insecure \
    --header "Accept: application/json" \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --data "client_id={{#{APP_KEY}}}&client_secret={{#{APP_SECRET}}}&grant_type=client_credentials&scope={{#{API_SCOPES}}}"


curl https://api.att.com/oauth/v4/token --request POST --insecure --data "client_id=uctqfmaqilqx6w2lfxpnmujmxardywln&client_secret=9vmzk9kvaziqoka0cto5terklmoa5fyg&grant_type=client_credentials&scope=ADS,SPEECH,STTC,TTS"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'Adding seed items'
Item.create! url_link: "http://qz.com/85400",
  price_web: 99, 
  classification: 'pants',
  description: 'good pants',
  name: 'nice pants',
  brand: 'brand of pants'

Item.create! url_link: "http://yinwang0.wordpress.com/2012/01/03/ydiff/",
  price_web: 100,
  classification: 'shirt',
  description: 'good shirt',
  name: 'nice shirt',
  brand: 'brand of shirt'

Item.create! url_link: "http://www.motherjones.com/",
  price_web: 50,
  classification: 'accessory',
  description: 'good necklace',
  name: 'nice bracelet',
  brand: 'Kendra Scott'


puts 'Done adding items'
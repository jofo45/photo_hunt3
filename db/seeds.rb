# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'Adding seed items'
Item.create! image: "http://www.peterglenn.com/sites/default/files/imagecache/product_1000x1000/product_images_new/70288_13_BRT_BLUE_LG.jpg",
  price_web: 99, 
  classification: 'pants',
  description: 'good pants',
  name: 'nice pants',
  brand: 'brand of pants'

Item.create! image: "https://cdn.shopify.com/s/files/1/0251/5984/products/shirt3_grande_grande.jpg?v=1382430194",
  price_web: 100,
  classification: 'shirt',
  description: 'good shirt',
  name: 'nice shirt',
  brand: 'brand of shirt'

Item.create! image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTbq-Hup2qFa3VDH2bDSrjFYcuVHLxor2F6-dnLsw17uJCgIKzG1g",
  price_web: 50,
  classification: 'accessory',
  description: 'good necklace',
  name: 'nice bracelet',
  brand: 'Kendra Scott'

puts 'Done adding items'
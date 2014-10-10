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
  brand: 'brand of pants',
  url_link: "http://www.peterglenn.com/product/nils-lauren-insulated-ski-pant-womens"  


Item.create! image: "http://slimages.macys.com/is/image/MCY/products/0/optimized/1067270_fpx.tif",
  price_web: 100,
  classification: 'shirt',
  description: 'good shirt',
  name: 'nice shirt',
  brand: 'brand of shirt',
  url_link: "http://www1.macys.com/shop/product/karl-lagerfeld-top-scoop-neck-long-sleeve-printed-tee?ID=629564"

Item.create! image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTbq-Hup2qFa3VDH2bDSrjFYcuVHLxor2F6-dnLsw17uJCgIKzG1g",
  price_web: 50,
  classification: 'accessory',
  description: 'good necklace',
  name: 'nice bracelet',
  brand: 'Kendra Scott',
  url_link: "http://www.cnn.com"

puts 'Done adding items'
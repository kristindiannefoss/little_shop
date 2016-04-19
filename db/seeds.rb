# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{name: "meats"},{name: "eggs"}])

items = Item.create([{
name: "Tyrannosaurus Flank",
description: "The best tyrannosaurus flank you've ever had!",
image_url: "http://previews.123rf.com/images/neilld/neilld1301/neilld130100039/17588909-A-Tyrannosaurus-Rex-Hunts-Against-a-White-Background--Stock-Photo.jpg",
price: 499.95,
category_id: categories.first.id},
{name: "Stegasaurus Eggs",
description: "Super young, non-developed Stegasaurus Eggs!",
image_url: "http://kidsquare.com/cdimages/x3262.jpg",
price: 1499.95,
category_id: categories.last.id},
{name: "Brontosaurus Wings",
description: "Brontosaurus wings cures cancer!",
image_url: "http://previews.123rf.com/images/neilld/neilld1301/neilld130100039/17588909-A-Tyrannosaurus-Rex-Hunts-Against-a-White-Background--Stock-Photo.jpg",
price: 299.95,
category_id: categories.first.id},
{name: "Triceratops Eggs",
description: "Better than the Stegasaurus Eggs!",
image_url: "http://kidsquare.com/cdimages/x3262.jpg",
price: 2499.95,
category_id: categories.last.id}])

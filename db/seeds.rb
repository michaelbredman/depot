# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create!(title: 'Diamond Jaxx Logo',
	description:
		%{
			<p>
				This is a description of the Diamond Jaxx logo
			</p>
		},
	image_url: 'dj.jpg',
	price: '49.99'
	)
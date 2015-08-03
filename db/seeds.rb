# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	User.destroy_all 
	puts "creating users"
	bob = User.create name: "Bob", last_name: "Robert", email: "b@b.com", password: "password"
	sally = User.create name: "Sally", last_name: "Susan", email: "s@s.com", password: "password"


	Virtue.destroy_all
	puts "creating virtues"

	honesty = Virtue.create title: "honesty", :public => true
	gratitude = Virtue.create title: "gratitude", :public => true
	moderation = Virtue.create title: "moderation", :public => false
	empathy = Virtue.create title: "empathy", :public => true

	
	i1 = Item.create name: "holding the door open", :public => false
	i2 = Item.create name: "giving food away", :public => true
	i3 = Item.create name: "working at a soup kitchen", :public => true
	i4 = Item.create name: "encouraging others", :public => true

	honesty.items << i1 << i2 << i3
	gratitude.items << i4 << i1
	moderation.items << i2 << i4
	empathy.items << i4 << i1


	bob.virtues << honesty << gratitude

	sally.virtues << empathy << moderation

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	User.delete_all 
	puts "creating users"
	bob = User.create name: "Bob", last_name: "Robert", email: "b@b.com", password: "password"
	sally = User.create name: "Sally", last_name: "Susan", email: "s@s.com", password: "password"
	

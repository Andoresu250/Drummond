# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	worker = Worker.new
	worker.first_name = "admin"
	worker.last_name = "admin"
	worker.cc = "0"
	worker.code = "0"
	worker.save!
	
	user = User.new
	user.email = "admin@admin.com"
	user.password = "123456"
	user.password_confirmation = '123456'	
	user.permission_level = 3
	user.worker = worker
	user.save!
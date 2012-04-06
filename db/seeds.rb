# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Admin','user','worker','guest'].each do |role|
  Role.find_or_create_by_role_name(:role_name => role)
end


User.find_or_create_by_name(:name => 'Jack',
                            :lastname => 'Jackson', 
                            :email => 'superadmin@super.com',
                            :username => 'superadmin',
                            :password => "password").roles << Role.first


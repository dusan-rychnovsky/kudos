# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.exists?(email: "durychno@microsoft.com")
  User.create!(username: "Dusan Rychnovsky", email: "durychno@microsoft.com", password: "password", admin: true)
end

unless User.exists?(email: "erpeltie@microsoft.com")
  User.create!(username: "Eric Peltier", email: "erpeltie@microsoft.com", password: "password")
end

unless User.exists?(email: "rupaul@microsoft.com")
  User.create!(username: "Ruma Paul", email: "rupaul@microsoft.com", password: "password")
end

unless User.exists?(email: "irkulako@microsoft.com")
  User.create!(username: "Iryna Kulakova", email: "irkulako@microsoft.com", password: "password")
end

unless User.exists?(email: "javrtisk@microsoft.com")
  User.create!(username: "Jan Vrtiska", email: "javrtisk@microsoft.com", password: "password")
end

unless User.exists?(email: "masalat@microsoft.com")
  User.create!(username: "Marek Salat", email: "masalat@microsoft.com", password: "password")
end

unless User.exists?(email: "jastrejc@microsoft.com")
  User.create!(username: "Jan Strejc", email: "jastrejc@microsoft.com", password: "password")
end

unless User.exists?(email: "stsaklas@microsoft.com")
  User.create!(username: "Stefanos Tsaklas", email: "stsaklas@microsoft.com", password: "password")
end

unless User.exists?(email: "adsyrek@microsoft.com")
  User.create!(username: "Adam Syrek", email: "adsyrek@microsoft.com", password: "password")
end

unless User.exists?(email: "danmdinu@microsoft.com")
  User.create!(username: "Dan Mihai Dinu", email: "danmdinu@microsoft.com", password: "password")
end

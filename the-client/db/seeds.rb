# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

filePath = File.join(Rails.root, 'db', 'pop-estimates-by-zip.json')
file = File.read(filePath) 
# TODO: maybe parse! in the controller
#       populating a proper DB can get a little slow
zips = JSON.parse(file)

zips.each do |k, record|
  Zip.create(record)
end

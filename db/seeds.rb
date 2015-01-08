require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

all_employees = JSON.parse(File.read("#{Rails.root}/db/seeds/all.json"))


number_of_inserts = 0
employee_entities = []
File.foreach("#{Rails.root}/db/seeds/mine.txt", encoding: 'utf-8') { |line|
  match = false
  all_employees.each { |employee|
    next if line == nil or employee == nil or employee['Name'] == nil
    next if line.strip != employee['Name'].strip
    match = true

    next if Employee.exists? :bekk_id => employee['Id']
    number_of_inserts = number_of_inserts + 1

    Employee.new({ :bekk_id => employee['Id'], :name => employee['Name'] }).save
  }

  puts "No match for #{line}" unless match
}

puts "Inserted #{number_of_inserts} employees"

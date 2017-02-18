# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
  tags = {languages: %w(ruby java go elixer), deployment: %w(capistrano linux heroku aws)  }
  tags.each do |tag, sub_tags|
    parent = Tag.create!(name: tag.to_s)
    sub_tags.each { |sub_tag| Tag.create!(name: sub_tag, parent_id: parent.id) }
  end  

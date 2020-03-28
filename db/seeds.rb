# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#/db/seeds.rb
require 'http' # Needed to open web urls

Episode.delete_all
url = "https://rickandmortyapi.com/api/episode/"
url2 = "https://rickandmortyapi.com/api/episode/?page=2"
info1 = HTTP.get(url)
info2 = HTTP.get(url2)
hash_info = eval(info1)
list_res = hash_info[:results]
hash_info2 = eval(info2)
list_res2 = hash_info2[:results]
list_res = list_res + list_res2

episodes = Episode.create(list_res)

Character.delete_all
(1..25).each do |page|
  url = "https://rickandmortyapi.com/api/character/?page=#{page}"
  info = HTTP.get(url)
  hash_info = eval(info)
  list_res = hash_info[:results]
  list_res.each do |ch|
    Character.create({:id => ch[:id],:name=>ch[:name], :status=> ch[:status], :species=> ch[:species], :tipo=> ch[:type], :gender=> ch[:gender], :origin=> ch[:origin], :location=> ch[:location], :image=> ch[:image], :episode=> ch[:episode], :url=> ch[:url], :created=> ch[:created]})
  end
end

Location.delete_all
(1..4).each do |page|
  url = "https://rickandmortyapi.com/api/location/?page=#{page}"
  info = HTTP.get(url)
  hash_info = eval(info)
  list_res = hash_info[:results]
  list_res.each do |ch|
    Location.create({:id => ch[:id],:name=>ch[:name], :tipo=> ch[:type], :dimension=> ch[:dimension], :residents=> ch[:residents], :url=> ch[:url], :created=> ch[:created]})
  end
end

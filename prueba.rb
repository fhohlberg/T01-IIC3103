
require 'http'

(1..25).each do |page|
  url = "https://rickandmortyapi.com/api/character/?page=#{page}"
  info = HTTP.get(url)
  hash_info = eval(info)
  list_res = hash_info[:results]
  list_res.each do |ch|
    puts ch[:id]
  end
end

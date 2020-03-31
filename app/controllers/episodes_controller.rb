require 'http'
class EpisodesController < ApplicationController

  def index
    #obtengo una lista con todos los episodios en JSON (hash)
    url = "https://rickandmortyapi.com/api/episode/"
    url2 = "https://rickandmortyapi.com/api/episode/?page=2"
    info1 = HTTP.get(url)
    info2 = HTTP.get(url2)
    hash_info = eval(info1)
    list_res = hash_info[:results]
    hash_info2 = eval(info2)
    list_res2 = hash_info2[:results]
    list_res = list_res + list_res2
    @episodes = list_res
  end

  def show
    info = HTTP.get("https://rickandmortyapi.com/api/episode/" + params[:id].to_s).to_s
    @episode = eval(info)
  end
end

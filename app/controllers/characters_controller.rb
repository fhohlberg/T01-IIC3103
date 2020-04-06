require 'http'
class CharactersController < ApplicationController

  def index
    #se obtiene una lista con todos los personajes en JSON (hash)
    string_ids = ""
    (1..493).each do |id|
      string_ids += id.to_s + ","
    end
    url = "https://rickandmortyapi.com/api/character/" + string_ids
    info = HTTP.get(url).to_s
    lista_res = eval(info)
    @characters = lista_res
  end

  def show
    info =  HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/character/" + params[:id].to_s).to_s
    @character = eval(info)
  end

end

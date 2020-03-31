require 'http'

class PagesController < ApplicationController

  def search
    #obtengo una lista con todos los episodios en JSON (hash)
    url = "https://rickandmortyapi.com/api/episode/"
    url2 = "https://rickandmortyapi.com/api/episode/?page=2"
    info1 = HTTP.get(url)
    info2 = HTTP.get(url2)
    hash_info = eval(info1)
    list_res = hash_info[:results]
    hash_info2 = eval(info2)
    list_res2 = hash_info2[:results]
    #obtengo lista de capitulos
    list_epi = list_res + list_res2

    #obtengo lista de lugares
    string_ids = ""
    (1..76).each do |id|
      string_ids += id.to_s + ","
    end
    url = "https://rickandmortyapi.com/api/location/" + string_ids
    info = HTTP.get(url).to_s
    lista_loc = eval(info)

    #obtengo lista de personajes
    string_ids = ""
    (1..493).each do |id|
      string_ids += id.to_s + ","
    end
    url = "https://rickandmortyapi.com/api/character/" + string_ids
    info = HTTP.get(url).to_s
    lista_char = eval(info)

    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results_e = list_epi.select {|episode| episode[:name].downcase.include? @parameter}
      @results_c = lista_char.select {|character| character[:name].downcase.include? @parameter}
      @results_l = lista_loc.select {|location| location[:name].downcase.include? @parameter}
    end
  end
end

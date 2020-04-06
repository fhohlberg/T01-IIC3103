require 'http'
class LocationsController < ApplicationController

  def index
    string_ids = ""
    (1..75).each do |id|
      string_ids += id.to_s + ","
    end
    url = "https://integracion-rick-morty-api.herokuapp.com/api/location/" + string_ids + "76"
    info = HTTP.get(url).to_s
    lista_res = eval(info)
    @locations = lista_res
  end

  def show
    info =  HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/location/" + params[:id].to_s).to_s
    @location = eval(info)
  end
end

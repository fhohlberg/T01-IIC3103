class PagesController < ApplicationController

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results_e = Episode.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @results_c = Character.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
      @results_l = Location.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end
end

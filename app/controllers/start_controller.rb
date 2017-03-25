class StartController < ApplicationController
  #Página inicial do airbnb
  #before_action :authenticate_user!
  def index
    @places = Place.all.limit(20).order("created_at DESC")
    @places_recent = Place.where(id: session[:place])
  end

end

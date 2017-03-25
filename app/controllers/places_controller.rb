class PlacesController < ApplicationController
  before_action :set_place, only: [:index, :edit]

  def index
    session_visit
    unless session[:place].include?(params[:id_place])
      session[:place] << params[:id_place]
    end
  end

  def my_places
    @places = @user.places
  end

  def new
    @place = Place.new
  end

  def create

    @place = Place.new(place_params)
    @place.user_id = current_user.id
    respond_to do |format|
      if @place.save
        AmenitiesPlace.process(@place, params[:amenities])
        format.html { redirect_to root_path, notice: "Criado com sucesso =)" }
      else
        format.html { render 'new'}
        format.json {  render json: @place.errors }
      end
    end
  end


  def edit

  end

  def destroy
  end

  def session_visit
    session[:place] ||= []
  end



  private

  def place_params
    params.require(:place).permit(:title, :accomodate_limit, :address, :bed_limit, :bathroom_limit, :room_limit, :price, :description, :place_type_id, :photo)
  end

  def set_place
    @place = Place.find(params[:id_place])
  end
end

class CityController < ApplicationController
  def show
    @city = City.find(params[:id]) # Obtenir la ville par son ID
    #@gossips = Gossip.where(city_id: @city.id)
    @gossips = Gossip.joins(user: :city).where(cities: { id: @city.id})
  end
end

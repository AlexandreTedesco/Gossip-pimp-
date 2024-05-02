class CityController < ApplicationController
  def show
    @city = City.find(params[:id])
    @gossips = Gossip.joins(user: :city).where(cities: { id: @city.id})
  end
end

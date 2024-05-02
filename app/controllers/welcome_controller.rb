class WelcomeController < ApplicationController
  def show
    #@first_name = params[:first_name]       #{@first_name} <--- censé être entre "bienvenue" et "!" a la ligne 4
    @message = "Bienvenue ! Ici, c'est notre super site de potins, il est chouette, non ?"
    @gossips = Gossip.all
  end
end

class WelcomeController < ApplicationController
  def show
    @first_name = params[:first_name]
    @message = "Bienvenue #{@first_name}! Ici, c'est notre super site de potins, il est chouette, non ?"
    @gossips = Gossip.all
  end
end

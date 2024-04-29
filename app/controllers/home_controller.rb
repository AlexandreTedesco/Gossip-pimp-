class HomeController < ApplicationController
  def show
    @message = "Ici, c'est notre super site de potins, il est chouette, non ?"
    @gossips = Gossip.all
  end
end

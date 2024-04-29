class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    if @gossip.save
      redirect_to gossip_path(@gossip), notice: 'Gossip créé avec succès !'
    else
      render :new
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id)
  end
end

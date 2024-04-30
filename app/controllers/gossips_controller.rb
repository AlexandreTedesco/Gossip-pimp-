class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    anonymous = User.find_by(first_name: "Tommy")
    @gossip.user = anonymous
    @gossip.update(gossip_params.merge(publication_date: DateTime.now))
    if @gossip.save
      flash[:success] = 'Gossip créé avec succès !'
      redirect_to gossip_path(@gossip)
    else
      redirect_to new_gossip_path
      flash[:error] = "Erreur lors de la création du Gossip : #{@gossip.errors.full_messages.join(", ")}"
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id, :city_id, :tag_id)
  end
end
class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
    @users = User.all
    @cities = City.all
  end

  def create
    @default_user = User.find_or_create_by(first_name: "Anonymous", email: "anonyme@anonymes.fr")
    
    @gossip = Gossip.new(gossip_params)
    @gossip.city_id = User.find_by(id: @gossip.user_id)&.city_id || City.first.id
    @gossip.user_id ||= @default_user.id
    @gossip.publication_date = DateTime.now

    if @gossip.save
      flash[:success] = 'Gossip créé avec succès !'
      redirect_to gossip_path(@gossip)
    else
      flash[:error] = "Erreur lors de la création du Gossip : #{@gossip.errors.full_messages.join(', ')}"
      redirect_to new_gossip_path
    end
  end

    def edit
      @gossip = Gossip.find(params[:id])
    end
  
    def update
      @gossip = Gossip.find(params[:id])
      
      if @gossip.update(gossip_params)
        flash[:success] = 'Potin mis à jour avec succès !'
        redirect_to gossip_path(@gossip)
      else
        flash[:error] = "Erreur lors de la mise à jour du potin : #{@gossip.errors.full_messages.join(', ')}"
        redirect_to edit_gossip_path
      end
    end

    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy

      flash[:success] = "Le potin a été supprimé avec succès."
      redirect_to home_path
    end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id, :city_id, :tag_id)
  end
end


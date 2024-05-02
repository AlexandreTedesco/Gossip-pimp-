class GossipsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_creator, only: [:edit, :update, :destroy]

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
    @users = User.all
    @cities = City.all
  end

  def create
    @gossip = Gossip.new(gossip_params)

    user =User.find_by(id: session[:user_id])
    if user&.city_id
      @gossip.city_id = user.city_id
    else
      flash[:error] = "L'utilisateur connecté n'a pas de ville associée."
      return redirect_to new_gossip_path
    end
    
    @gossip.user_id = session[:user_id]

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
    params.require(:gossip).permit(:title, :content, :tag_id)
  end

  def ensure_creator
    @gossip = Gossip.find(params[:id])
    unless @gossip.user_id == current_user.id
      flash[:error] = "Vous n'êtes pas autorisé à modifier ce potin."
      redirect_to gossip_path(@gossip)
    end
  end
end


class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :update]

  def create
    gossip_id = params[:comment][:gossip_id]
    gossip = Gossip.find_by(id: gossip_id)
    
    @comment = Comment.new(comment_params)
    
    if gossip.nil?
      flash[:error] = "Potin non trouvé."
      redirect_back(fallback_location: root_path) and return
    end
    
    @comment.user_id = session[:user_id]
    @comment.gossip_id = gossip.id
    

    if @comment.save
      flash[:success] = "Commentaire ajouté avec succès !"
      redirect_to gossip_path(@comment.gossip)
    else
      flash[:error] = @comment.errors.full_messages.join(", ")
      redirect_to gossip_path(@gossip)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update(comment_params)
      flash[:success] = "Commentaire mis à jour avec succès !"
      redirect_to "/gossips/#{@comment.gossip_id}"
    else
      flash[:error] = @comment.errors.full_messages.join(", ")
      redirect_to "/gossips/#{@comment.gossip_id}"
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Commentaire supprimé avec succès"
      redirect_to gossip_path(@gossip)
    else
      flash[:error] = "Action impossible, réessayez ultérieurement."
      redirect_to gossip_path(@comment.gossip)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :gossip_id)
  end
end

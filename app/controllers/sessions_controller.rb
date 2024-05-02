class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Bienvenue, #{user.first_name}!"
      redirect_to home_path
    else
      flash[:error] = "Email ou mot de passe incorrect"
      redirect_to new_session_path
    end
  end


  def destroy
    logout
    flash[:success] = "Vous avez été déconnecté"
    redirect_to root_path
    
  end
end
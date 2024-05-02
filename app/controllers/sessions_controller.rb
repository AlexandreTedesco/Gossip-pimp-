class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Bienvenue, #{user.first_name}!"
      redirect_to root_path
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{session[:user_id]}"
    else
      flash[:error] = "Email ou mot de passe incorrect"
      render :new
    end
  end


  def destroy
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{session[:user_id]}"
    logout
    flash[:success] = "Vous avez été déconnecté"
    redirect_to root_path
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$#{session[:user_id]}"
  end
end
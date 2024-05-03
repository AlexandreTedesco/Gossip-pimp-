class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    #  login(user) <-- VOIR SI CELA DOIT REMPLACER LA LIGNE PRECEDENTE
    if params[:remember_me] == "1"
      remember_token = SecureRandom.urlsafe_base64
      user.update(remember_digest: BCrypt::Password.create(remember_token))
      cookies.permanent[:remember_token] = remember_token
      cookies.permanent[:user_id] = user.id
    end
    # on va cuisiner le cookie pour l'utilisateur
      remember(user)

      flash[:success] = "Bienvenue, #{user.first_name}!"
      redirect_to home_path
    else
      flash[:error] = "Email ou mot de passe incorrect"
      redirect_to new_session_path
    end
  end


  def destroy
    @user = User.find_by(id: session[:user_id])
    session.delete(:user_id)
    cookies.delete(:remember_token)
    #logout
    log_out(@user)
    flash[:success] = "Vous avez été déconnecté"
    redirect_to root_path
    
  end
end
module SessionsHelper
  # def logout
  #   session.delete(:user_id)
  #   @current_user = nil
  # end

  def log_out(user)
    session.delete(:user_id)
    forget(user)
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies[:remember_token]
      user = User.find_by(id: cookies[:user_id])
      if user && BCrypt::Password.new(user.remember_digest).is_password?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end


  # def current_user
  #   current_user = User.find_by(id: session[:user_id])
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end


  def authenticate_user!
    unless session[:user_id]
      flash[:error] = "Vous devez être connecté pour accéder à cette page."
      redirect_to new_session_path
    end
  end

  def remember(user)
    # ici je vais créer un remember_token qui est une suite aléatoire de caractères
    remember_token = SecureRandom.urlsafe_base64
  
    # j'ai mon token, je vais stocker son digest en base de données :    
    user.remember(remember_token)
  
    #  maintenant, je vais créer les cookies : un cookie qui va conserver l'user_id, et un autre qui va enregistrer le remember_token
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = remember_token
  
  end

  def forget(user)

    if user
    # on remet le remember_digest à nil puisqu'il ne nous servira plus :
      user.update(remember_digest: nil)
    end
    
    # on efface les cookies dans le navigateur de l'utilisateur
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  
  end

end

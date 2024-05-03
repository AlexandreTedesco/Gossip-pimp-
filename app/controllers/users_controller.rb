class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
    #  login(user) <-- VOIR SI CELA DOIT REMPLACER LA LIGNE PRECEDENTE

    # on va cuisiner le cookie pour l'utilisateur
    remember(@user)

      flash[:success] = "Bienvenue, #{@user.first_name}!"
      redirect_to home_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :age, :city_id, :password, :password_confirmation)
  end
end
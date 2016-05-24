class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  
  def index
  	@users = User.all
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Usuário criado com sucesso."
  		redirect_to @user
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		flash[:notice] = "Usuário alterado com sucesso."
  		redirect_to @user
  	else
  		render :edit
  	end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "O usuário foi removido com sucesso."
      redirect_to users_url
    end
  end

  private
  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

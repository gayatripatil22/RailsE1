class UsersController < ApplicationController
  def index
    @users= User.all.order(created_at: :desc)
  end

  def new
    @user=User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to root_path, status: :see_other
  end
end
private

  def user_params
    params.require(:user).permit(:name, :age, :gender)
  end

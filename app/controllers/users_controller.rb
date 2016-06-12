class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Account created. Please log in now.'
      redirect_to user_path(@user)
    else
      flash[:alert] = "Error creating account: #{@user.email}"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Account is updated successfully.'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Update unsuccessful. Please try again.'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'Account is deleted'
    redirect_to statuses_path
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

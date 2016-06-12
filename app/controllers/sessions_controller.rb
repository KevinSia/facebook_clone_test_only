class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate && match_password
      log_in(@user)
      flash[:notice] = "Welcome, #{@user.email}!"
      redirect_to statuses_path
    else
      flash[:alert] = 'Please log in again'
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def match_password
    params[:session][:password] == params[:session][:password_confirmation]
  end

  def session_params
    params.require(:session).permit(:email, :password, :password_confirmation)
  end
end


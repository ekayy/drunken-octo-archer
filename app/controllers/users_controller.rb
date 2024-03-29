class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def new
  	@user = User.new
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show

  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      session[:user_id] = @user.id
  	  sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
  	else
  	  render "new"
  	end
  end

  private

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end

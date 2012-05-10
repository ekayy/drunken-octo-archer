class ProfilesController < ApplicationController
	before_filter :signed_in_user
  
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = current_user.build_profile(params[:profile])
  	if @profile.save
      flash[:notice] = 'Profile was successfully created.'
      redirect_to customize_path
    else
      flash[:notice] = 'Error.  Something went wrong.'
      render "new"
    end
  end

	def show
	end
end

__END__
  def index
	  @user = User.find(params[:user_id])
	  @profile = @user.profile(:order => "created_at DESC")
	end

	def show
	  @user = User.find(params[:user_id])
	  @profile = @user.profile.find(params[:id])
	end

	def new
	  @user = User.find(params[:user_id])
	  @profile = @user.profile.build
	end

	def edit
	  @user = User.find(params[:user_id])
	  @profile = @user.profile.find(params[:id])
	end

	def create
	  @user = User.find(params[:user_id])
	  @profile = @user.profile.build(params[:profile])
    if @profile.save
      flash[:notice] = 'Profile was successfully created.'
      redirect_to(@profile)
    else
      flash[:notice] = 'Error.  Something went wrong.'
      render :action => "new"
    end
  end
end
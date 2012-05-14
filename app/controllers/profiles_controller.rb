class ProfilesController < ApplicationController
	before_filter :signed_in_user
	before_filter :set_user
  
  def new
  	@profile = Profile.new
  end

  def create
  	@profile = @user.build_profile(params[:profile])
  	if @profile.save
      flash[:success] = 'Profile was successfully created.'
      redirect_to :action => 'show', :id => @user.id
    else
      flash[:notice] = 'Error.  Something went wrong.'
      render "new"
    end
  end

	def show
		 @user = User.find(params[:user_id])
	end

	def edit
		@user = User.find(params[:id])
		@profile = @user.profile(params[:user_id])
	end

	def update
		@user = User.find(params[:id])
		@profile = @user.profile
		if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile updated"
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private

    def correct_user
      @profile = current_user.profile.find_by_id(params[:id])
      redirect_to root_path if @profile.nil?
    end

    def set_user
  @user = User.find(session[:user_id])
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
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index]
  before_filter :signed_in_user_2, only: [:new, :create]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  #before_filter :admin_asshole, only: :

	def new
    	@user = User.new
    end

  def index
    @users = User.paginate(page: params[:page])
  end

	def show
		@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:microposts_page])
    @projects = @user.projects.paginate(page: params[:projects_page])
	end

	def create
    	@user = User.new(params[:user])
    	if @user.save
        sign_in @user
        flash[:success] = "Welcome to the FunkApp!"
      	redirect_to @user
    	else
      		render 'new'
    	end
  	end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_path  
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  private

    def signed_in_user_2
      if signed_in?
        redirect_to root_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user.admin?
      #if current_user?(@user) 
      #  flash[:fail] = "Asshole"
      #end
    end

end

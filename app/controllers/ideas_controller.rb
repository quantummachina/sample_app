class IdeasController < ApplicationController
  before_filter :signed_in_user

  def create
  	#<<current page>>`!!!
    @user = User.find(params[:idea][:user_id])
    @user.ideas.create!(thought: params[:idea][:thought])

    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = User.find(Idea.find(params[:id]).user_id)
    Idea.find(params[:id]).destroy
	respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def post
  	redirect_to root_path
  end

end
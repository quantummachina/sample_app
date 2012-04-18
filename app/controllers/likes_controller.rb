class LikesController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = Project.find(params[:like][:project_id])
    @project.likes.create!(user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
  	
    @project = Like.find(params[:id]).project
    Like.find(params[:id]).destroy
    #current_user.leave!(@project)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
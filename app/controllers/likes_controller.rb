class LikesController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = Project.find(params[:like][:project_id])
    @project.likes.create!(user_id: current_user.id)
    #@project.inclike
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
  	
    @project = Like.find(params[:id]).project
    Like.find(params[:id]).destroy
    #@project.update_parameters(likes_count: (@project.likes_count-1))
    #current_user.leave!(@project)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
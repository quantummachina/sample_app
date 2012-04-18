class CommentsController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = Project.find(params[:comment][:project_id])
    @project.comments.create!(user_id: current_user.id, content: params[:comment][:content])
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
  	
    @project = Comment.find(params[:id]).project
    Comment.find(params[:id]).destroy
    #current_user.leave!(@project)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
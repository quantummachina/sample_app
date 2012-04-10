class CollabsController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = Project.find(params[:collab][:project_id])
    current_user.join!(@project)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
    @project = Collab.find(params[:id]).project
    current_user.leave!(@project)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
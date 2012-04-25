class UpdatesController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = Project.find(params[:update][:project_id])
    @project.updates.create(params[:update])
    redirect_to @project
  end

  def destroy
    @project = Update.find(params[:id]).project
    Update.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
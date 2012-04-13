class NeedsController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = Project.find(params[:need][:project_id])
    @project.needs.create(params[:need])
    redirect_to @project
  end

  def destroy
    @project = Need.find(params[:id]).project
    Need.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
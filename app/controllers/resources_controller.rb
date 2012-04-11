class ResourcesController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = Project.find(params[:resource][:project_id])
    @project.resources.create(content: params[:resource][:content])

    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
    @project = Resource.find(params[:id]).project
    Resource.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end
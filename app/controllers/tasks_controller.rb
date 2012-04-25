class TasksController < ApplicationController
  before_filter :signed_in_user

  def create

    @project = Project.find(params[:task][:project_id])
    @project.tasks.create!(params[:task])

    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
    @project = Task.find(params[:id]).project
    Task.find(params[:id]).destroy
	respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def check
    @project = Task.find(params[:id]).project
    Task.find(params[:id]).update_attributes(done: true)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end


end
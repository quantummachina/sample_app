class ProjectsController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  	@project = Project.find(params[:id])
  end

  def index
  	@projects = Project.paginate(page: params[:page])
  end

end

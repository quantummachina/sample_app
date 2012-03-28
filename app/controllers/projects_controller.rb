class ProjectsController < ApplicationController

  #before_filter y after_filter

  before_filter :load_filename
  after_filter :save_filename
#agregar filtro de correct_user para destroy

#require 'projects_helper'

  def new
  end

  def show
  	@project = Project.find(params[:id])
  end

  def index
  	@projects = Project.paginate(page: params[:page])
  end

  def new
  	@project = Project.new
  end

  def create
    #independiente de la subida de archivo
    @project = current_user.projects.build(params[:project])
    @project.cover = @filename
    


    if @project.save
      flash[:success] = "Your project has been created!"
      redirect_to @project

    else
      render 'new'
    end
  end

  def destroy
    current_user.projects.find(params[:id]).destroy
    redirect_back_or root_path
  end

  def upload_cover
    tmp = params[:cover_file].tempfile
    filename = params[:cover_file].original_filename
        directory = "public/projects_cover/"
        path = File.join(directory, filename)
     File.open(path, "wb").write(params[:cover_file].read)
     #@project.cover = filename
     #redireccionar o parcial.
     @filename = filename

    respond_to do |format|
      format.html { redirect_to '/start_project' } #funciona sin ajax
      format.js
    end

  end

  private
    def load_filename
      @filename = session[:filename] || ""
    end

    def save_filename
      session[:filename] = @filename
    end

end
#Utilizar un private para pasar el nombre de la imagen.

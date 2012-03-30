class ProjectsController < ApplicationController

  before_filter :load_filename
  after_filter :save_filename
#agregar filtro de correct_user para destroy

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
    @project = current_user.projects.build(name: params[:project][:name], description: params[:project][:description], cover: @filename, profitable: params[:project][:profitable], tags: params[:project][:tags], category: cat2num(params[:project][:category])) #Reemplazar pamas project, por la forma completa desglosada
    #@project.cover = @filename

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

  def edit
    @project = current_user.projects.find(params[:id])
    @filename = @project.cover
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @filename != @project.cover
      @project.cover=@filename
    end
    if @project.update_attributes(params[:project])
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  #Idea para integrar el file uploaded con un [unico bot[on]]
#@user = User.new(params[:user])
#is equivalent to
#@user = User.new(name: "Foo Bar", email: "foo@invalid",
                 #password: "foo", password_confirmation: "bar")
#Agregar un m[etodo para eliminar archivos cuando se suben nuevos??

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

    def cat2num(cat) #Repetido en la vista
    if cat == "Other"
      return 99
    else
      catalog = ["Art", "Technology", "Music", "Film", "Photography", "Dance", "Design", "Games", "Publishin", "Theater"] #0..9
      catalog.index(cat)
    end

  end

end
#Utilizar un private para pasar el nombre de la imagen.

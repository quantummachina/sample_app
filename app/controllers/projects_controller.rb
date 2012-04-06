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
    @categories = Category.all
    @project.category_id=1 #default "other"
  end

  def create
    #independiente de la subida de archivo
    @project = current_user.projects.build(name: params[:project][:name], description: params[:project][:description], cover: @filename, profitable: params[:project][:profitable], tags: params[:project][:tags], category_id: params[:project][:category], online: params[:project][:online], finished: params[:project][:finished], place: params[:project][:place]) #Reemplazar pamas project, por la forma completa desglosada
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
    @categories = Category.all
    @filename = @project.cover
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @filename != @project.cover
      @project.cover=@filename
    end

    if @project.update_attributes(name: params[:project][:name], description: params[:project][:description], cover: @filename, profitable: params[:project][:profitable], tags: params[:project][:tags], category_id: params[:project][:category], online: params[:project][:online], finished: params[:project][:finished], place: params[:project][:place])
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def nav
#    debugger
    cat_indx = params[:category] || 0
    @categories = Category.all
    if cat_indx == 0
      @projects = Project.paginate(page: params[:page])
    else
      #for i in cat_indx
      #  @projects += Category.find(i).projects
      #end

      #current_category = Category.find(cat_indx) current_category.projects
      @projects = Category.find(cat_indx).projects.paginate(page: params[:page]) 
    end

  end

  def sort
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

  def collab!(a_user)
    collabs.create!(a_user)
  end
  def uncollab!(a_user)
    collabs.find_by_user_id(a_user.id).destroy
  end
  def collab? (a_user)
    collabs.find_by_user_id(a_user.id)
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
      catalog = ["Art", "Technology", "Music", "Film", "Photography", "Dance", "Design", "Games", "Publishing", "Theater"] #0..9
     return catalog.index(cat)
    end

    

  end

end
#Utilizar un private para pasar el nombre de la imagen.

class ProjectsController < ApplicationController

  before_filter :load_filename
  after_filter :save_filename
  #agregar filtro de correct_user para destroy

  def show
  	@project = Project.find(params[:id])
  end

  def new
  	@project = Project.new
    @categories = Category.all
    @project.category_id=1 #default "other"
  end

  def create
    #independiente de la subida de archivo
    @project = current_user.projects.build(name: params[:project][:name], description: params[:project][:description], cover: @filename, profitable: params[:project][:profitable], tags: params[:project][:tags], category_id: params[:project][:category], online: params[:project][:online], finished: params[:project][:finished], place: params[:project][:place]) #Reemplazar pamas project, por la forma completa desglosada

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


  def index
    cat_indx = params[:category] || ""
    @categories = Category.all #TODAS

    if cat_indx == ""
    
    @ptop = Project.reorder('likes_count DESC').paginate(page: params[:ptop], per_page: 2)
    @pnew = Project.paginate(page: params[:pnew], per_page: 5)
    @prand = Project.reorder('RANDOM()').paginate(page: params[:prand], per_page: 10)
    else #UNA CATEGORIA
      #@projects = Category.find(cat_indx).projects.paginate(page: params[:p_algo])

    @ptop = Category.find(cat_indx).projects.reorder('likes_count DESC').paginate(page: params[:ptop], per_page: 2)
    @pnew = Category.find(cat_indx).projects.paginate(page: params[:pnew], per_page: 5)
    @prand = Category.find(cat_indx).projects.reorder('RANDOM()').paginate(page: params[:prand], per_page: 10)

    end

      @cat_indx=cat_indx
    

  end


  def nav #WORK TO DO! Ref> Behance
    cat_indx = params[:category] || ""
    onln = params[:online] || true
    offln = params[:offline] || true
    @categories = Category.all #TODAS


    if params[:search]
      @projects = Project.search_pro(params[:search])
    else

    
    if cat_indx == ""
      @projects = Project.paginate(page: params[:page])
    else #UNA CATEGORIA
      @projects = Category.find(cat_indx).projects.paginate(page: params[:page])
    end
      @cat_indx=cat_indx

    if onln
      @p1 = @projects.find_all_by_online(true)
    end
    if offln
      @p2 = @projects.find_all_by_online(false)
    end

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

end
#Utilizar un private para pasar el nombre de la imagen.

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

    @project = current_user.projects.build( params[:project] )

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
    #@filename = @project.cover
  end

  def update
    @project = current_user.projects.find(params[:id])

    if @project.update_attributes(params[:project])
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


  def delete_cover
    @project = params[:project]
    filename = @project.cover
    directory = "public/projects_cover/"
    path = File.join(directory, filename)
    File.delete(path)
    render 'edit'
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

  private #aun se ocupan???
    def load_filename
      @filename = session[:filename] || ""
    end

    def save_filename
      session[:filename] = @filename
    end

end
#Utilizar un private para pasar el nombre de la imagen.

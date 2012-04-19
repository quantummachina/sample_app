class IdeasController < ApplicationController
  before_filter :signed_in_user

  def create

    @user = User.find(params[:user_id])
    @user.ideas.create!(thought: params[:thought])

    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = User.find(Idea.find(params[:id]).user_id)
    Idea.find(params[:id]).destroy
	respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def publish
    #store_idea(params[:idea][:thought])
    if params[:decition] == 'Save'
      create
    else

      if params[:id]
        convert(Idea.find(params[:id]))
      else
        convert(current_user.ideas.create!(thought: params[:thought]))
      end

    redirect_to edit_project_path(current_user.projects.first)
    end

  end

  private

    def convert(idea)
      idea.user.projects.create!(name: 'Idea', description: idea.thought)
      idea.delete
    end

end
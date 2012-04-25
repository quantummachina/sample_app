class ThrdsController < ApplicationController
  before_filter :signed_in_user

  def create

    @project = Project.find(params[:thrd][:project_id])
    @project.thrds.create!(content: params[:thrd][:content], user_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
    @project = Thrd.find(params[:id]).project
    Thrd.find(params[:id]).destroy
	respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end


end
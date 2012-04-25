class CommenthrdsController < ApplicationController
  before_filter :signed_in_user

  def create
    
    @thrd = Thrd.find(params[:commenthrd][:thrd_id])
    @project = @thrd.project
    @thrd.commenthrds.create!(comment: params[:commenthrd][:comment], user_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
    @project = Commenthrd.find(params[:id]).thrd.project
    Commenthrd.find(params[:id]).destroy
	respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end


end
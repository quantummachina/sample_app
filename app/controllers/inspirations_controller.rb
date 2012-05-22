class InspirationsController < ApplicationController
	before_filter :signed_in_user

  def create
    current_user.inspirations.create(params[:inspiration])

    respond_to do |format|
      format.html { redirect_to '/board' }
      format.js
    end
  end

  def destroy
    Inspiration.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to '/board' }
      format.js
    end
  end

  def index
  	inspirations = current_user.inspirations
  end

  def crosspost
    current_user.inspirations.create(content: params[:content])
    redirect_to "/board"
  end

end

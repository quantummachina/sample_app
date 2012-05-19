class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @conversations = current_user.conversations + current_user.reverse_conversations
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
  	end
  end

  def help
  end

  def about
  end

  def contact
  end

end

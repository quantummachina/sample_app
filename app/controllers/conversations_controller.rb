class ConversationsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  def index
    #debugger
  	@conversations = current_user.conversations + current_user.reverse_conversations
    @conversation = if params[:id] then Conversation.find(params[:id]) else @conversations.first end
  end

  def show
    redirect_to action: 'index', id: params[:id]
  end

  def create
  	c1 = current_user.conversations.find_by_interlocutor_id(params[:conversation][:interlocutor_id])
  	c2 = current_user.reverse_conversations.find_by_user_id(params[:conversation][:interlocutor_id])

  	if c1 then redirect_to c1 else
  		if c2 then redirect_to c2 else
  			current_user.conversations.create(interlocutor_id: params[:conversation][:interlocutor_id])
  			redirect_to current_user.conversations.last
  		end
  	end

  end

end

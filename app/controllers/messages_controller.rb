class MessagesController < ApplicationController
  respond_to :js, :html

  def create
    @message = Message.create(params[:message])
    @show = Show.find_by_id(params[:show_id])
  end
  
  def destroy
    message = Message.find(params[:id])
    message.destroy
  end
end

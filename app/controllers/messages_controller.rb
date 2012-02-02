class MessagesController < ApplicationController
  respond_to :js, :html

  def create
    @message = Message.create(params[:message])
    @message.show_id = params[:show_id]
    if @message.save!
      respond_with @message
    else
      redirect_to root_path
    end
  end
  
  def destroy
    message = Message.find(params[:id])
    message.destroy
  end
end

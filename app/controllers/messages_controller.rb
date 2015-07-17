class MessagesController < ApplicationController
  def index
    # Get all messages
    @messages = Message.all
    @message = Message.new
  end
  
  ## Terry wuz here
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'Your message has been saved'
    else
      #If message was not saved
      @messages = Message.all
      flash.now[:alert] = "A poopoo happened upon attempting to save your message"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
  ## Terry is no longer here
end
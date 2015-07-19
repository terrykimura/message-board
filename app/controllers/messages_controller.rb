class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
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
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      # Redirect to top if save successful
      redirect_to root_path , notice: 'Your message has been saved'
    else
      # Redirect to edit page if save unsuccessful
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'Your message has been deleted'
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  ## Terry iz no longer here
end

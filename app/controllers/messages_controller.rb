class MessagesController < ApplicationController
  before_action :set_message, only: [:show]
  before_action :check_login

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html {
          flash[:success] = t('message.create.success')
          redirect_to @message.reservation
        }
        format.json { render :show, status: :created, location: @message }
      else
        format.html {
          flash[:success] = t('message.create.success')
          redirect_to @message.reservation
        }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:content, :reservation_id)
  end

end

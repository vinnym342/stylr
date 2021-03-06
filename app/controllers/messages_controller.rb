class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /messages
  # GET /messages.json
  def index
    @current_user_id = current_user.id
    @conversation = Conversation.find_by(id: conversation_params[:conversation_id])
    if @conversation.stylist_id == current_user.id
      @pen_pal = Profile.find_by(user_id: @conversation.asker_id)
    else
      @pen_pal = Profile.find_by(user_id: @conversation.stylist_id)
    end
    puts '=' *50
    pp @pen_pal
    puts '=' *50
    @messages = Message.where(conversation: @conversation).order(:created_at)
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.conversation_id = conversation_params[:conversation_id]
    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_messages_path(conversation_params[:conversation_id]), notice: 'Message sent' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.permit(:conversation_id)
    end
    def message_params
      params.require(:message).permit(:message)
    end
end

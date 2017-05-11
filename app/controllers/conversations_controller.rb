class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # POST /conversations
  # POST /conversations.json
  def create

    professional_profile = ProfessionalProfile.find_by(user_id: conversation_params[:stylist_id])
    amount = professional_profile.message_price * 100
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => amount,
        :description => 'Conversation pay',
        :currency    => 'aud'
      )
      @conversation = Conversation.new(conversation_params)
      @conversation.asker_id = current_user.id
      @conversation.question = message_params[:question]
      @conversation.resolved = false

      respond_to do |format|
        if @conversation.save
          format.html { redirect_to conversation_messages_path(@conversation), notice: 'Conversation was successfully created.' }
          format.json { render :show, status: :created, location: @conversation }
        else
          format.html { redirect_to professional_profile_path(professional_profile) }
          format.json { render json: @conversation.errors, status: :unprocessable_entity }
        end
      end

    rescue Stripe::CardError => e
    flash[:notice] = e.message
    redirect_to professional_profile_path(profressional_profile)
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(update_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end
    def message_params
      params.require(:question).permit(:question)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:professional_profile).permit(:stylist_id)
    end
    def update_params
      params.require(:conversation).permit(:resolved)
    end
end

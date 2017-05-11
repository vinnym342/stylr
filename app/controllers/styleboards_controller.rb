class StyleboardsController < ApplicationController
  before_action :set_styleboard, only: [:show, :edit, :update, :destroy]
  before_action :set_new_styleboard, only: [:create]

  # GET /styleboards
  # GET /styleboards.json
  def index
    #arranged by number of likes, from left to right
    #@styleboards = Styleboard.all.sort_by{|x| x.likes.where(liked: true).count }.reverse
    #arranged by number of likes -  dislikes, from left to right
    @styleboards = Styleboard.all.sort_by{|styleboard| styleboard.likes.where(liked: true).count - styleboard.likes.where(liked: false).count }.reverse
  end
  def search
    search_tags = params[:search].gsub(/(#)\w+/).map {|tag| tag}
    @stylboard_ids = []
    search_tags.each do |search_tag|
      hashtags = Hashtag.where(tag: search_tag)
      if hashtags.present?
        hashtags.each do |hashtag|
          @stylboard_ids << hashtag.styleboard_id
        end
      end
    end
    @stylboard_ids.uniq! if @stylboard_ids.present?
  end

  def most_disliked
    #arranged by number of dislikes, from left to right
    @styleboards = Styleboard.all.sort_by{|x| x.likes.where(liked: false).count }.reverse
  end

  # GET /styleboards/1
  # GET /styleboards/1.json
  def show
    @styleboard = Styleboard.find(params[:id])
  end

  # GET /styleboards/new
  def new
    @styleboard = Styleboard.new
  end

  # GET /styleboards/1/edit
  def edit
  end

  # POST /styleboards
  # POST /styleboards.json
  def create
    @styleboard = Styleboard.new(styleboard_params)
    @styleboard.user = current_user
    hashtags = (styleboard_params[:description]).gsub(/(#)\w+/)
    hashtags.each do |hashtag|
    Hashtag.new(styleboard: @styleboard, tag: "#{hashtag}").save
    end
    respond_to do |format|
      if @styleboard.save
        format.html { redirect_to @styleboard, notice: 'Styleboard was successfully created.' }
        format.json { render :show, status: :created, location: @styleboard }
      else
        format.html { render :new }
        format.json { render json: @styleboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /styleboards/1
  # PATCH/PUT /styleboards/1.json
  def update
    Hashtag.where(styleboard: @styleboard).each {|hashtag| hashtag.destroy}
    hashtags = (styleboard_params[:description]).gsub(/(#)\w+/)
    hashtags.each do |hashtag|
    Hashtag.new(styleboard: @styleboard, tag: "#{hashtag}").save
    end
    respond_to do |format|
      if @styleboard.update(styleboard_params)
        format.html { redirect_to @styleboard, notice: 'Styleboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @styleboard }
      else
        format.html { render :edit }
        format.json { render json: @styleboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /styleboards/1
  # DELETE /styleboards/1.json
  def destroy
    @styleboard.destroy
    respond_to do |format|
      format.html { redirect_to styleboards_url, notice: 'Styleboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_new_styleboard
      @new_styleboard = Styleboard.new
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_styleboard
      @styleboard = Styleboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def styleboard_params
      params.require(:styleboard).permit(:description, :public, :photo, :name)
    end
end

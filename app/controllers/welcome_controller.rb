class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @myprofile = Profile.find_by(user: current_user)
    @questions_asked = Conversation.where(asker_id: current_user.id, resolved: false)
    @questions_to_answer = Conversation.where(stylist_id: current_user.id, resolved: false)
    @their_questions_answered = Conversation.where(stylist_id: current_user.id, resolved: true)
    @my_questions_answered = Conversation.where(asker_id: current_user.id, resolved: true)
  end

  def search
    @option = params[:option]
    if @option == "hashtag"
      @usernames =
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
  elsif @option == "username"
    @profiles = Profile.where("username LIKE ?",'%' + params[:search] + '%')
  end
  end
end

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @handicap = Handicap.new
    unless @user.handicaps.count == 0
      @handicap_object = HandicapCalculator.new(@user)
      @handicap_index = @handicap_object.get_handicap_index
    end
    @my_score_cards = Handicap.my_handicaps(@user)
    @meetup = Meetup.new
    @my_meetups = Meetup.my_meetups(@user)
    @all_meetups = Meetup.all
  end

  def index
  end

end

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @handicap = Handicap.new
    unless @user.handicaps.count == 0
      @handicap_object = HandicapCalculator.new(@user)
      @handicap_index = @handicap_object.get_handicap_index
    end
    @my_scorecards = Handicap.my_handicaps(@user)
    @my_first_five_cards = @my_scorecards.reverse.shift(5)
    @my_chopped_scorecards = []
    counter = 0
    while counter < @my_scorecards.length
      block = @my_scorecards.slice(counter..counter + 4)
      counter += 5
      @my_chopped_scorecards << block
      @my_chopped_scorecards = @my_chopped_scorecards.reverse
    end


    @meetup = Meetup.new
    @my_meetups = Meetup.my_meetups(@user)
    @all_meetups = Meetup.all
  end

  def index
  end

end

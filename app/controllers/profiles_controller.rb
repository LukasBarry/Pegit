class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @handicap = Handicap.new
    unless @user.handicaps.count == 0
      @all_my_scorecards = Handicap.my_handicaps(@user)
      @handicap_calculator = HandicapCalculator.new(@user)
      @handicap_index, num = @handicap_calculator.get_handicap_index
      @scorecards = @user.lowest_differentials
      @lowest_scorecards = @scorecards.shift(num)

    end
    @all_meetups = Meetup.all
    @meetup = Meetup.new
    @my_meetups = Meetup.my_meetups(@user)
    @my_upcoming_meetups = @my_meetups.select {|meetup| meetup.datetime > Time.now}
  end

  def index
  end

end

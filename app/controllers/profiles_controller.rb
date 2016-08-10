class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
    @handicap = Handicap.new
    unless @user.handicaps.count == 0
      @handicap_object = HandicapCalculator.new(@user)
      @handicap_index = @handicap_object.get_handicap_index
    end
    @my_score_cards = Handicap.my_handicaps(@user)
  end

  def index
  end

end

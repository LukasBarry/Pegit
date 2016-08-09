class ProfilesController < ApplicationController
  def show
    @handicap_calculator = HandicapCalculator.new(:user_id) #or should this be 'current_user'?
    @handicap_index = @handicap_calculator.get_handicap_index

  end
  def index
  end
end

class MeetupsController < ApplicationController
  before_action :set_meetup, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @meetup = Meetup.new
  end

  def edit
  end

  def update
    if @meetup.update(meetup_params)
      redirect_to @meetup, notice: "Your Meetup has been updated"
    else
      render :edit
    end
  end

  def create
    @meetup = Meetup.new(meetup_params)
    if @meetup.save
      redirect_to @meetup, notice: "You just created a Meetup!"
    else
      render :new
    end
  end

  def feed
    @meetup = Meetup.where("user_id in (?) OR user_id = ?", current_user).order('created_at DESC')
    @meetup = Meetup.new
  end

  private

  def set_meetup
    @meetup = Meetup.find(params[:id])
  end

 def meetup_params
    params.require(:meetup).permit(:datetime, :description, :user_id)
 end

end

class MeetupsController < ApplicationController
  before_action :set_meetup, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

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
      redirect_to feed_path, notice: "You just created a Meetup!"
    else
      render :new
    end
  end

  def show
    @meetup = Meetup.find(params[:id])
    @comment = Comment.new
  end


  def feed
    if user_signed_in?
      @my_meetups = Meetup.my_meetups(current_user).order('created_at DESC')
      @meetup = Meetup.new
      @user = User.find(user_id = current_user.id )
      @comment = Comment.new
    end
    @all_meetups = Meetup.all.order('created_at DESC')
  end

  private

  def set_meetup
    @meetup = Meetup.find(params[:id])
  end

  def meetup_params
    params.require(:meetup).permit(:datetime, :description, :user_id)
  end

end

class PartnersController < ApplicationController

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @meetup.partners.where(user_id: current_user.id).first_or_create
      redirect_to request.referrer, notice: "You've joined this meetup!"
  end
  def destroy
    @meetup = Meetup.find(params[:meetup_id])
    @meetup.partners.find_by(user_id: current_user.id).destroy
    redirect_to request.referrer
  end


end

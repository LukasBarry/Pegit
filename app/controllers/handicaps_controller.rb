class HandicapsController < ApplicationController
  before_action :set_handicap, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @handicap = Handicap.new
  end
  def show
  end
  def index
  end
  def create
    @handicap = Handicap.new(handicap_params)
    if @handicap.save
      redirect_to @handicap, notice: "saved."
    else
      render :new
    end
  end

  def update
    if @handicap.update(handicap_params)
      redirect_to @handicap, notice: "updated"
    else
      render :edit
    end
  end

  def destroy
    @handicap.destroy
    redirect_to root_path
  end

  private

  def set_handicap
    @handicap = Handicap.find(params[:id])
  end

  def handicap_params
    params.require(:handicap).permit(:score, :course_rating, :course_slope_rating)
  end
end

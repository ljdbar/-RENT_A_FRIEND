class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
    @booking = Booking.new
  end

  def new
    @friend = Friend.new
    @categories = %w[sports music funeral family date travel]
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.save
    redirect_to friend_path(@friend)
    raise
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :categories, :age, :location, :pronouns, :bio, :daily_rate, :user_id)
  end
end

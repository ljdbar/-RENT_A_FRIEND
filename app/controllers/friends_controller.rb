class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
    @categories = %w[sports music funeral family date travel]
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
   if  @friend.save
      redirect_to friend_path(@friend)
   else
    @categories = %w[sports music funeral family date travel]
    render :new, status: :unprocessable_entity
   end
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :age, :location, :pronouns, :bio, :daily_rate, :user_id, :categories)
    #change :catagories to catagories: []
  end
end

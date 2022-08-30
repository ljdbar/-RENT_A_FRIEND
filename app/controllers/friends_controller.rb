class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

#   def create
#     @friend = Friend.new(friend_params)
#     @friend.save
#     redirect_to friend_path(@friend)
#   end

#   private

#   def friend_params
#     params.require(:friend).permit(WHOLE BUNCH O SHIT)
#   end
end

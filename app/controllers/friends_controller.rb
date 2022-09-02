class FriendsController < ApplicationController
  def index
    # @friends = Friend.all
    if params[:query].present?
      @friends = Friend.search_by_categories_and_location_and_age(params[:query])
    else
      @friends = Friend.all
    end

    @markers = @friends.geocoded.map do |friend|
      {
        lat: friend.latitude,
        lng: friend.longitude,
        info_window: render_to_string(partial: "info_window", locals: {friend: friend}),
        image_url: helpers.asset_url("mappin3.png")
      }
    end
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
    @friend.user = current_user
    if @friend.save
      redirect_to friend_path(@friend)
    else
      @categories = %w[sports music funeral family date travel]
      render :new, status: :unprocessable_entity
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:first_name,
                                   :last_name,
                                   :age,
                                   :location,
                                   :pronouns,
                                   :bio,
                                   :daily_rate,
                                   :user_id,
                                   :categories, # change :catagories to catagories: []
                                   :photo)
  end
end

# Test code here:
# --------------
# if !current_user.friends.empty?
#   redirect_to friend_path(current_user.friends.first)
# end

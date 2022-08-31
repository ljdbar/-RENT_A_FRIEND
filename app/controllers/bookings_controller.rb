class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @friend = Friend.find(params[:friend_id])
  end

  def create
    @friend = Friend.find(params[:friend_id])
    @booking = Booking.new(booking_params)
    @booking.friend = @friend
    if @booking.save
      redirect_to friend_path(@friend)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @friend = booking.friend
    @booking.destroy
    redirect_to friend_path(@friend), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

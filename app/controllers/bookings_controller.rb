class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    # @trip = Trip.find(params[:trip_id])
    @booking = Booking.find(params[:id])
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @booking = Booking.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @booking = Booking.new(booking_params)
    @booking.trip = @trip
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking), notice: 'New Booking was created successfully!'
    else
      render :new
    end
  end

  # def edit
  #   @booking = Booking.find(params[:id])
  # end

  # def update
  #   @bookings = Booking.find(params[:id])
  #   @bookings.update(booking_params)
  #   redirect_to bookings_path
  # end

  def destroy
    @bookings = Booking.find(params[:id])
    @bookings.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end

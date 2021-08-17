class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  before_action :authorize_booking, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  def index
    @bookings = policy_scope(Booking)
    # @bookings.user = current_user
    # @bookings = Booking.current_user.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    authorize_booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize_booking
    @booking.user = current_user

    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully completed.'
    else
      render :new
    end
  end

  def edit
    # @booking = Booking.find(params[:id])
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully deleted.'
  end

  private

  def authorize_booking
    authorize(@booking)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :user_id, :trip_id)
  end
end

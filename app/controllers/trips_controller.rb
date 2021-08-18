class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @trips = policy_scope(Trip)

    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        info_window: render_to_string(partial: "info_window", locals: { trip: trip })
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip), notice: 'New Trip was created successfully!'
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trips = Trip.find(params[:id])
    @trips.update(trip_params)
    redirect_to trips_path
  end

  def destroy
    @trips = Trip.find(params[:id])
    @trips.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :price, :number_of_people, :details, :user_id, :photo)
  end
end

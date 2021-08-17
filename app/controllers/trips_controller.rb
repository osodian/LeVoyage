class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @trips = policy_scope(Trip)
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
    @trips = Trip.find(params[:id])
  end

  def update
    @trips = Trip.find(params[:id])
    @trips.update(trips_params)
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

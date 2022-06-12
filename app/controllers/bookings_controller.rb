class BookingsController < ApplicationController

  before_action :set_booking, only: %i[edit update destroy decline_booking accept_booking]

  def index
    @bookings_owner = policy_scope(Booking).select do |booking|
      booking.garage.owner == current_user
    end

    @bookings_client = policy_scope(Booking).select do |booking|
      booking.client == current_user
    end
  end

  def new
    @booking = Booking.new
    @garage = Garage.find(params[:garage_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(rev_params)
    @garage = Garage.find(params[:garage_id])
    @client = current_user
    @booking.garage = @garage
    @booking.client = @client
    authorize @booking
    if @booking.save
      flash[:notice] = 'Ya tomamos tu reserva'
      redirect_to garage_path(@garage)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @booking.update(rev_params)
      flash[:notice] = 'Booking editado'
      redirect_to garage_path(@booking.garage)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to garage_path(@booking.garage)
  end

  def accept_booking
    @booking.status = 'confirmed'
    @booking.save
    redirect_to bookings_path
  end

  def decline_booking
    @booking.status = 'declined'
    @booking.save
    redirect_to bookings_path
  end

  private

  def rev_params
    params.require(:booking).permit(:initial_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end

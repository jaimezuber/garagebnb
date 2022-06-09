class BookingsController < ApplicationController

  before_action :set_booking, only: [:edit, :update, :destroy, :accept_booking, :accept_booking]

  def new
    @booking = Booking.new
    @garage = Garage.find[params[:garage_id]]
  end

  def create
    @booking = Booking.new(rev_params)
    @garage = Garage.find[params[:garage_id]]
    @client = current_user
    @booking.garage = @garage
    @booking.client = @client
    if @booking.save
      redirect_to garage_path(@garage)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @booking.update(rev_params)
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
  end

  def cancel_booking
    @booking.status = 'canceled'
  end

  private

  def rev_params
    params.require(:booking).permit(:initial_date, :end_date)
  end

  def set_booking
    Booking.find(params[:id])
  end
end

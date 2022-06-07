class BookingsController < ApplicationController
  def index

  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def delete

  end
end

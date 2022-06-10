class GaragesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_garage, only: %i[show edit destroy update]

  def index
    @garages = Garage.all
  end

  def show; end

  def new
    @garage = Garage.new
    @owner = User.find(params[:id])
  end

  def create
    @garages = Garage.new(rev_params)
    if @garages.save
      redirect_to garage_path(@garage)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @garage.update(rev_params)
      redirect_to garage_path(@garage)
    else
      render :edit
    end
  end

  def delete
    @garage.destroy
    redirect_to garages_path
  end

  private

  def rev_params
    params.require(:garage).permit(:location, :photo)
  end

  def find_garage
    @garage = Garage.find(params[:id])
  end
end

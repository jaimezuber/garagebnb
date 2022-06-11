class GaragesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_garage, only: %i[show edit destroy update]

  def index
    @garages = policy_scope(Garage).order(created_at: :desc)
  end

  def show; end

  def new
    @garage = Garage.new
    authorize @garage
  end

  def create
    @garage = Garage.new(rev_params)
    @garage.owner = current_user
    authorize @garage
    if @garage.save
      redirect_to garages_path
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

  def destroy
    @garage.destroy
    redirect_to garages_path
  end

  private

  def rev_params
    params.require(:garage).permit(:location, :photo, :title, :price)
  end

  def find_garage
    @garage = Garage.find(params[:id])
    authorize @garage
  end
end

class GaragesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_garage, only: %i[show edit destroy update]

  def index
    @garages = policy_scope(Garage).order(created_at: :desc)
    if params[:query].present?
      @garages = Garage.search_by_title_and_description(params[:query])
    else
      @garages = Garage.all
    end
  end

  def show
    @marker = [{
                lat: @garage.latitude,
                lng: @garage.longitude
              }]
  end

  def new
    @garage = Garage.new
    authorize @garage
  end

  def create
    @garage = Garage.new(rev_params)
    @garage.owner = current_user
    authorize @garage
    if @garage.save
      flash[:notice] = 'Garage creado'
      redirect_to garages_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @garage.update(rev_params)
      flash[:notice] = 'Garage editado'
      redirect_to garage_path(@garage)
    else
      render :edit
    end
  end

  def destroy
    @garage.destroy
    redirect_to garages_path
  end

  def my_garages
    @garages = policy_scope(Garage).select do |garage|
      garage.owner == current_user
    end
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

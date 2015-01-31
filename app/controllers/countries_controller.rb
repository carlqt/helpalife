class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new country_params
    redirect_to edit_country_path(@country), success: "#{@country.name} saved!" and return if @country.save
    render :new
  end

  def edit
    @country = Country.find params[:id]
    @all_states = @country.states.order(:name).pluck(:name)
  end

  private
  def country_params
    params.require(:country).permit(:name)
  end
end

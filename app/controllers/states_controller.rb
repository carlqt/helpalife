class Admin::StatesController < ApplicationController
  def create
    State.upload params[:file].tempfile, params[:country_id]
    redirect_to :back
  end

  def delete_all
    State.destroy_all
    redirect_to :back
  end
end
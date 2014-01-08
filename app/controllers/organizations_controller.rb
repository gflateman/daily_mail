class OrganizationsController < ApplicationController
  before_action :fetch_record, only: [:new, :create, :show, :edit]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end

private

  def organization_params
    params.require(:submission).permit(:name, :email)
  end

  def fetch_record
    if (id = params[:id])
      @org = Organization.find(id)
    else
      @org = Organization.new
    end
  end

end

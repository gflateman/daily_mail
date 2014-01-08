class SubmissionsController < ApplicationController
  before_action :fetch_record, only: [:new, :create, :show]

  def index
    @org = Organization.find(params[:organization_id])
    @submissions = @org.submissions
  end

private

  def submission_params
    params.require(:submission).permit(:name, :email)
  end

  def fetch_record
    @org = Organization.find(params[:organization_id])
    if (id = params[:id])
      @submission = @org.submissions.find(id)
    else
      @submission = @org.submissions.new
    end
  end

end

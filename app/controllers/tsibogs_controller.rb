class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reports = Report.all
  end

  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html  { redirect_to(@report,
                                   :notice => 'Report was successfully created.') }
        format.json  { render :json => @report,
                              :status => :created, :location => @report }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @report.errors,
                              :status => :unprocessable_entity }
      end
    end
  end

  def show
    @report       = Report.find(params[:id])
    @parties      = User.parties
    @contributors = @report.contributors
    @comments     = @report.comments

    respond_to do |format|
      format.html
      format.json  { render :json => @report }
    end
  end

  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html  { redirect_to(@report,
                                   :notice => 'Report was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @report.errors,
                              :status => :unprocessable_entity }
      end
    end
  end

  def tag_party
    @report = Report.find(params[:id])
    @report.tag_party(params[:contributors])
    redirect_to(@report, :notice => 'Report was successfully tagged.')
  end

  def comment
    @report = Report.find(params[:id])
    @report.create_comment(current_user, params[:comment])
    redirect_to(@report, :notice => 'Successfully created a comment.')
  end

  def update_status
    @report = Report.find(params[:id])
    @report.create_status(current_user, params[:status], params[:message])
    redirect_to(@report, :notice => 'Successfully updated the status.')
  end

  def suggest

  end

  private

    def report_params
      params.require(:report).permit(:user_id, :description, :photo)
    end
end

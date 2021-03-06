require 'dbi'

class ReportsController < ApplicationController
  before_filter :load_database, :only => [:index, :new, :create]

  def load_database
    @database = Database.find(params[:database_id])
  end

  def index
    @reports = Report.all
  end
  
  def show
    @report = Report.find(params[:id])
    @database = @report.database
    @dbh = DBI.connect("DBI:Mysql:#{@database.schema}:#{@database.hostname}", @database.username, @database.password)
    @sth = @dbh.prepare(@report.query)
    @sth.execute
    @column_names = @sth.column_names
    @result = @sth.fetch_all
  end
  
  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(params[:report])
    @report.database = @database
    if @report.save
      flash[:notice] = "Successfully created report."
      redirect_to @report
    else
      render :action => 'new'
    end
  end
  
  def edit
    @report = Report.find(params[:id])
  end
  
  def update
    @report = Report.find(params[:id])
    if @report.update_attributes(params[:report])
      flash[:notice] = "Successfully updated report."
      redirect_to @report
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:notice] = "Successfully destroyed report."
    redirect_to database_url(@report.database)
  end
end

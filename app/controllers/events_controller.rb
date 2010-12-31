class EventsController < ApplicationController

  before_filter :parse_date_param, :except => :show

  def show
    @event = Event.find(params[:id])
  end

  def new
    now = Time.now
    @projects = Project.all
    @event = Event.new(
      :start_at => Time.local(@year, @month, @day, now.hour, now.min),
      :end_at => Time.local(@year, @month, @day, now.hour, now.min))
  end

  def create
    @projects = Project.all
    @event = Event.new params[:event]
    @saved = @event.save
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes params[:event]
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
  end

  private

  def parse_date_param
    @date = Date.parse params[:date]
    @year = @date.year
    @month = @date.month
    @day = @date.day
  end

end

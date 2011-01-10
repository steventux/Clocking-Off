class EventsController < ApplicationController

  before_filter :parse_date_param, :only => [:new, :create]

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
    @event.user = current_user
    @saved = @event.save
  end

  def edit
    @projects = Project.all
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @saved = @event.update_attributes params[:event]
    @events = Event.for_user(current_user).on_date(@event.start_at) if @saved
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    @events = Event.for_user(current_user).on_date(@event.start_at)
  end

  private

  def parse_date_param
    if params[:date]
      @date = Date.parse params[:date]
      @year = @date.year
      @month = @date.month
      @day = @date.day
    end
  end

end

class EventsController < ApplicationController

  before_filter :parse_date_param, :except => :show

  def show
    @event = Event.find(params[:id])
  end

  def new
    now = Time.now
    @event = Event.new(
      :start_at => Time.local(@year, @month, @day, now.hour, now.min),
      :end_at => Time.local(@year, @month, @day, now.hour < 12 ? now.hour + 8 : now.hour + 4, now.min))
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      redirect_to calendar_path(@date.year, @date.month)
    else
      render :action => :new
    end
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

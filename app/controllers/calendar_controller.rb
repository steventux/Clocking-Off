class CalendarController < ApplicationController

  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end

  def day
    start_of_day = Time.local(params[:year], params[:month], params[:day], 0, 0)
    end_of_day = Time.local(params[:year], params[:month], params[:day], 23, 59, 59)
    @events = Event.where("start_at > ? AND end_at < ?", start_of_day.to_s(:db), end_of_day.to_s(:db)).order("start_at")
  end

end

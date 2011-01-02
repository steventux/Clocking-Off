class CalendarController < ApplicationController

  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.for_user(current_user).event_strips_for_month(@shown_month)
  end

  def day
    @events = Event.for_user(current_user).on_date(Time.local(params[:year], params[:month], params[:day]))
  end

end

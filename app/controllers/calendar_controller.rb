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

  def timesheet
    @ts_start_date = Date.parse(params[:ts_start_date])
    @ts_end_date = Date.parse(params[:ts_end_date])
    @client = Client.find(params[:client])
    @events_hash = {}
    Event.for_user(current_user).for_client(@client).between(@ts_start_date, @ts_end_date).each do |event|
      key = event.start_at.strftime("%D")
      @events_hash[key] = [] if @events_hash[key].nil?
      @events_hash[key] << event
    end
  end

end

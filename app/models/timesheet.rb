class Timesheet
  attr_accessor :start_date, :end_date, :user, :client, :headings, :total_hours, :hours, :project_hours

  def initialize(user, client, start_date, end_date)
    @user = user
    @client = client
    @start_date = start_date
    @end_date = end_date

    populate_headings
    populate_hours
  end

  private

  def populate_headings
    @headings = []
    @start_date.upto(@end_date) do |date|
      @headings << date.strftime("%d/%m")
    end
  end

  def populate_hours
    @hours = {}
    @project_hours = {}
    @total_hours = 0.00
    Event.for_user(@user).for_client(@client).between(@start_date, @end_date).order("project_id, start_at").each do |event|
      project_name = event.project.name
      date_key = event.start_at.strftime("%d-%m-%y")
      @hours[project_name] = {} if @hours[project_name].nil?
      @hours[project_name][date_key] = 0.00 if @hours[project_name][date_key].nil?
      @hours[project_name][date_key] += event.hours
      @total_hours += event.hours
      @project_hours[project_name] = 0.00 if @project_hours[project_name].nil?
      @project_hours[project_name] += event.hours
    end
  end
end

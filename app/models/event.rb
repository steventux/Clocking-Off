require 'event_validator'

class Event < ActiveRecord::Base
  include ActiveModel::Validations

  has_event_calendar

  belongs_to :project

  validates_presence_of :name
  validates_presence_of :start_at
  validates_numericality_of :project_id
  validates_with EventValidator

  #scope :for_date, lambda { |date|
  #  date = Date.parse date_str unless date.kind_of? Date
  #  start_of_day = Time.local(date.year, date.month, date.day, 0, 0)
  #  end_of_day = Time.local(date.year, date.month, date.day, 23, 59, 59)
  #  where("start_at > ? AND end_at < ?", start_of_day.to_s(:db), end_of_day.to_s(:db)).order("start_at")
  #}

end

require 'event_validator'

class Event < ActiveRecord::Base
  include ActiveModel::Validations

  has_event_calendar

  belongs_to :user
  belongs_to :project

  validates_presence_of :name
  validates_presence_of :start_at
  validates_numericality_of :user_id, :with => "must belong to a user"
  validates_numericality_of :project_id, :with => "must belong to a project"
  validates_with EventValidator

  scope :for_user, lambda { |user| where("user_id = ?", user.id).order("start_at") }
  scope :for_client, lambda { |client| joins(:project => :client).where("clients.id = ?", client.id).order("start_at") }
  scope :on_date, lambda { |date|
    start_of_day = Time.local(date.year, date.month, date.day, 0, 0)
    end_of_day = Time.local(date.year, date.month, date.day, 23, 59, 59)
    where("start_at > ? AND end_at < ?", start_of_day.to_s(:db), end_of_day.to_s(:db)).order("start_at")
  }
  scope :between, lambda { |*args|
    start_time = Time.local(args.first.year, args.first.month, args.first.day, 0, 0)
    end_time = Time.local(args.last.year, args.last.month, args.last.day, 23, 59, 59)
    where("start_at > ? AND end_at < ?", start_time.to_s(:db), end_time.to_s(:db)).order("start_at")
  }

  def hours
    (end_at - start_at) / 60 / 60
  end

end

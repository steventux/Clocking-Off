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

end

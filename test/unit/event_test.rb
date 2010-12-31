require 'test_helper'

class EventTest < ActiveSupport::TestCase

  should validate_presence_of :name
  should validate_presence_of :start_at
  should validate_numericality_of :project_id

  context "An Event instance" do
    should "validate the start time is before the end time" do
      start_time = Time.local(2010,12,25,13,0)
      end_time = Time.local(2010,12,25,11,0)
      assert_raise ActiveRecord::RecordInvalid do
        @event = Event.make(:start_at => start_time, :end_at => end_time)
      end
    end
  end

end

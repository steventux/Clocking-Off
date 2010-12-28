require 'test_helper'

class CalendarHelperTest < ActionView::TestCase

  context "The CalenderHelper" do

    context "event_time method" do

      setup do
        @event = Event.make(:start_at => Time.local(2010,12,25,10,40), :end_at => Time.local(2010,12,25,12,55))
      end

      should "format the event start and end time" do
        assert_equal "10.40-12.55", event_time(@event)
      end

    end

  end

end

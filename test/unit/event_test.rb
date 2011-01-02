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

  context "The Event class" do
    context "when using the scope 'for_user'" do
      setup do
        @me = User.make
        @another_user = User.make
        @my_event = Event.make(:name => "Mine", :user => @me)
        @their_event = Event.make(:name => "Theirs", :user => @another_user)
        @my_events = Event.for_user(@me)
        @their_events = Event.for_user(@another_user)
      end
      should "return events belonging to the given user" do
        assert !@my_events.empty?
        assert_equal @my_events.first, @my_event
        assert !@their_events.empty?
        assert_equal @their_events.first, @their_event
      end
    end

    context "when using the scope 'on_date'" do
      setup do
        @xmas_dinner = Event.make(:start_at => Time.local(2010,12,25,12,0), :end_at => Time.local(2010,12,25,14,0))
        @boxing_day_sandwiches = Event.make(:start_at => Time.local(2010,12,26,12,0), :end_at => Time.local(2010,12,26,14,0))
        @xmas_events = Event.on_date(Date.parse('2010-12-25'))
        @boxing_day_events = Event.on_date(Date.parse('2010-12-26'))
      end
      should "return events occurring on the given date" do
        assert !@xmas_events.empty?
        assert_equal @xmas_events.first, @xmas_dinner
        assert !@boxing_day_events.empty?
        assert_equal @boxing_day_events.first, @boxing_day_sandwiches
      end
    end
  end

end

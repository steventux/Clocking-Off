require 'test_helper'

class CalendarControllerTest < ActionController::TestCase

  context "The CalendarController" do

    context "day action" do
      setup do
        10.times do
          start_hour = rand(12)
          end_hour = start_hour + rand(12)
          Event.make(:start_at => Time.local(2010,12,25,start_hour,rand(60)),
            :end_at => Time.local(2010,12,25,end_hour,rand(60)))
        end
        5.times do
          start_hour = rand(12)
          end_hour = start_hour + rand(12)
          Event.make(:start_at => Time.local(2010,12,26,start_hour,rand(60)),
            :end_at => Time.local(2010,12,26,end_hour,rand(60)))
        end
        get :day, :year => 2010, :month => 12, :day => 25, :format => :js
      end

      should "retrieve events for the date params passed" do
        assert_equal 10, assigns(:events).size
      end
    end

  end

end

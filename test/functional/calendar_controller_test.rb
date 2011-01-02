require 'test_helper'

class CalendarControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  context "The CalendarController" do

    context "day action" do
      setup do
        @user = User.make
        @other_user = User.make
        sign_in @user
        @project = Project.make
        10.times do
          start_hour = rand(12)
          end_hour = start_hour + 1 + rand(11)
          Event.make(:user => @user, :start_at => Time.local(2010,12,25,start_hour,rand(60)),
            :end_at => Time.local(2010,12,25,end_hour,rand(60)))
        end
        5.times do
          start_hour = rand(12)
          end_hour = start_hour + 1 + rand(11)
          Event.make(:user => @user, :start_at => Time.local(2010,12,26,start_hour,rand(60)),
            :end_at => Time.local(2010,12,26,end_hour,rand(60)))
        end
        2.times do
          start_hour = rand(12)
          end_hour = start_hour + 1 + rand(11)
          Event.make(:name => "Not Mine", :user => @other_user,
            :start_at => Time.local(2010,12,26,start_hour,rand(60)),
            :end_at => Time.local(2010,12,26,end_hour,rand(60)))
        end
        get :day, :year => 2010, :month => 12, :day => 25, :format => :js
      end

      should "retrieve events for the logged in user and date params" do
        assert_equal 10, assigns(:events).size
      end
    end

  end

end

require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  context "The EventsController" do

    setup do
      @user = User.make
      sign_in @user
    end

    context "GET to new method" do
      setup do
        get :new, :date => '2010-12-25', :format => :js
      end
      should assign_to :event
    end

    context "POST to create method" do
      setup do
        @start_at = Time.local(2010,12,25,10)
        @end_at = Time.local(2010,12,25,18)
        post :create, :date => '2010-12-25', :event => { :name => 'Foo at Bar',
          :start_at => @start_at, :end_at => @end_at }, :format => :js
      end
      should assign_to :event
      should "create a new event record" do
        assert_equal @start_at, assigns(:event).start_at
        assert_equal @end_at, assigns(:event).end_at
      end
    end

    context "GET to edit method" do

      should "" do
      end

    end

    context "PUT to update method" do

      should "" do
      end

    end

    context "DELETE to destroy method" do

      should "" do
      end

    end


  end

end

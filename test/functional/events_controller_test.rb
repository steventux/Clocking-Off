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
        @project = Project.make
        @start_at = Time.local(2010,12,25,10)
        @end_at = Time.local(2010,12,25,18)
        post :create, :date => '2010-12-25', :event => { :name => 'Foo at Bar',
          :start_at => @start_at, :end_at => @end_at, :project => @project }, :format => :js
      end
      should assign_to :event
      should "create a new event record" do
        assert assigns :saved
        assert_equal @start_at, assigns(:event).start_at
        assert_equal @end_at, assigns(:event).end_at
      end
    end

    context "GET to edit method" do
      setup do
        @event = Event.make(:name => "Thingy")
        get :edit, :id => @event.to_param, :format => :js
      end
      should "place the correct event in the editing form" do
        assert_equal "Thingy", assigns(:event).name
      end

    end

    context "PUT to update method" do
      setup do
        @event = Event.make(:name => "Thingy")
        put :update, :id => @event.to_param, :event => { :name => "Thingy Bob" }, :format => :js
      end
      should "update the relevant attributes" do
        assert assigns :saved
        assert_equal "Thingy Bob", assigns(:event).name
      end

    end

    context "DELETE to destroy method" do
      setup do
        @event = Event.make
      end
      should "remove an Event record" do
        assert_difference('Event.count', -1) do
          delete :destroy, :id => @event.to_param, :format => :js
        end
      end

    end


  end

end

require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  context "The ProjectsController" do

    setup do
      @user = User.make
      sign_in @user
      @project = Project.make
    end

    context "GET to index" do
      setup do
        get :index
      end
      should respond_with :success
      should "retrieve a collection of projects" do
        assert_not_nil assigns(:projects)
      end
    end

    context "GET to new" do
      setup do
        get :new
      end
      should respond_with :success
    end

    context "POST to create" do
      should "create a Project record" do
        assert_difference('Project.count') do
          post :create, :project => @project.attributes
        end
      end
      should_redirect_to("project page") { project_path(assigns(:project)) }
    end

    context "GET to show" do
      setup do
        get :show, :id => @project.to_param
      end
      should respond_with :success
    end

    context "GET to edit" do
      setup do
        get :edit, :id => @project.to_param
      end
      should respond_with :success
    end

    context "PUT to update" do
      setup do
        put :update, :id => @project.to_param, :project => @project.attributes
      end
      should_redirect_to("project page") { project_path(assigns(:project)) }
    end

    context "DELETE to destroy" do
      should "remove a Project record" do
        assert_difference('Project.count', -1) do
          delete :destroy, :id => @project.to_param
        end
      end
      # should_redirect_to("projects page") { projects_path }
    end

  end
end

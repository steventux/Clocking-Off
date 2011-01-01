require 'test_helper'

class ClientsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @user = User.make
    sign_in @user
    @client = Client.make
  end

  test "should get index" do
    get :index, :format => :js
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new, :format => :js
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, :client => @client.attributes, :format => :js
    end

    #assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, :id => @client.to_param, :format => :js
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @client.to_param, :format => :js
    assert_response :success
  end

  test "should update client" do
    put :update, :id => @client.to_param, :client => @client.attributes, :format => :js
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, :id => @client.to_param, :format => :js
    end

    #assert_redirected_to clients_path
  end
end

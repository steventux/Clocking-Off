class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :find_clients

  private

  def find_clients
    @clients = Client.all
  end
end

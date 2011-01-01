class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(params[:client])
    @saved = @client.save
    @clients = Client.all if @saved
  end

  def update
    @client = Client.find(params[:id])
    @saved = @client.update_attributes(params[:client])
    @clients = Client.all if @saved
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    @clients = Client.all
  end
end

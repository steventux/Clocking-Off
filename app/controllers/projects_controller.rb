class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @clients = Client.all
  end

  def edit
    @project = Project.find(params[:id])
    @clients = Client.all
  end

  def create
    @project = Project.new(params[:project])
    @saved = @project.save
    @projects = Project.all if @saved
  end

  def update
    @project = Project.find(params[:id])
    @saved = @project.update_attributes(params[:project])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    @projects = Project.all
  end
end

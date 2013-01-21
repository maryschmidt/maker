class ProjectsController < ApplicationController
  def index
    @projects = Project.order("created_at DESC").page params[:page]
  end

  def show
    @project = current_project
    @steps = @project.steps
  end

  def new
    @project = Project.new
  end

  def edit
    @project = current_project
  end

  def create
    @project = build_project
    @project.save
    redirect_to projects_path, notice: "Project was successfully created."
  end

  def update
    @project = current_project
    @project.update_attributes(params[:project])
    redirect_to projects_path, notice: "Project was successfully updated."
  end

  def destroy
    @project = current_project
    @project.destroy
    redirect_to current_user
  end

  private
  def current_project
    Project.find(params[:id])
  end

  def build_project
    Project.new(params[:project])
  end
end

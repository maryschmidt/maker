class ProjectsController < ApplicationController
  skip_before_filter :authorize, only: :index
  respond_to :html, :json

  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def show
    @project = current_project
    @comment = Comment.new
    @steps = @project.steps
    @user = @project.user
    respond_with(@project, :methods => [:image_url])
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
    respond_with(@project)
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
    current_user.projects.new(params[:project])
  end
end

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
    @user = @project.user
    respond_with(@project, :methods => [:image, :image_url])
  end

  def new
    @project = Project.new
    @project.assets.build
  end

  def edit
    @project = current_project
  end

  def create
    @project = build_project
    @project.save
    respond_with(@project)
  end

  def update
    @project = current_project
    @project.update_attributes(params[:project])
    respond_with(@project)
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

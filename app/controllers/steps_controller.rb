class StepsController < ApplicationController
  def index
    @steps = current_project.steps
  end

  def show
    @project = current_project
    @step = current_step(@project)
  end

  def new
    @project = current_project
    @step = Step.new
  end

  def edit
    @project = current_project
    @step = current_step(@project)
  end

  def create
    @project = current_project
    @step = @project.steps.new(params[:step])
    @step.save
    redirect_to @project, notice: "Step was successfully created."
  end

  def update
    @project = current_project
    @step = current_step(@project)
    @step.update_attributes(params[:step])
    redirect_to @project, notice: "Step was successfully updated."
  end

  def destroy
    @project = current_project
    @step = current_step(@project)
    @step.destroy
    redirect_to @project
  end

  private
  def current_project
    Project.find(params[:project_id])
  end

  def current_step project
    project.steps.find(params[:id])
  end
end

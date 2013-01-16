class StepsController < ApplicationController
  def index
    @steps = current_project.steps.all
  end

  def show
    @step = current_project.steps.find(params[:id])
  end

  def new
    @step = current_project.steps.new
  end

  def edit
    @step = current_project.steps.find(params[:id])
  end

  def create
    @step = current_project.steps.new(params[:step])
    if @step.save
      redirect_to [current_user, current_project], notice: 'Step was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @step = current_project.steps.find(params[:id])
    if @step.update_attributes(params[:step])
      redirect_to [current_user, current_project], notice: 'Step was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @step = current_project.steps.find(params[:id])
    @step.destroy
    redirect_to user_project_path(current_user, current_project)
  end

  private
  def current_project
    @current_project = Project.find(params[:project_id])
  end
end

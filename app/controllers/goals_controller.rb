class GoalsController < ApplicationController
  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = build_goal
    @goal.save
    redirect_to dashboard_projects_path
  end

  def edit
    @goal = current_goal
  end

  def update
    @goal = current_goal
    @goal.update_attributes(params[:goal])
    redirect_to dashboard_projects_path
  end

  def destroy
    @goal = current_goal
    @goal.destroy
    redirect_to dashboard_projects_path
  end

  private
  def current_goal
    Goal.find(params[:id])
  end

  def build_goal
    current_user.goals.new(params[:goal])
  end
end

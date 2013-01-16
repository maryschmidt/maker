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
    redirect_to current_user
  end

  def destroy
    @goal = current_goal
    @goal.destroy
    redirect_to current_user
  end

  private
  def current_goal
    current_user.goals.find(params[:id])
  end

  def build_goal
    current_user.goals.new(params[:goal])
  end
end

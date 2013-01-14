class GoalsController < ApplicationController
  def index
    @goals = current_user.goals.all
  end

  def show
    @goal = current_user.goals.find(params[:id])
  end

  def new
    @goal = current_user.goals.new
  end

  def edit
    @goal = current_user.goals.find(params[:id])
  end

  def create
    @goal = current_user.goals.new(params[:goal])
    if @goal.save
      redirect_to user_path(current_user), notice: 'Goal was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @goal = current_user.goals.find(params[:id])
    if @goal.update_attributes(params[:goal])
      redirect_to [current_user, @goal], notice: 'Goal was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy
    redirect_to user_path(current_user)
  end
end

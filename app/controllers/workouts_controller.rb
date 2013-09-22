class WorkoutsController < ApplicationController
  def new
    @workout = Workout.generate current_user
  end

  def create
    @workout = Workout.new workout_params

    if @workout.save
      redirect_to today_path
    else
      render :new
    end
  end

  private
  def workout_params
    params.require(:workout).permit :nothing_yet
  end

end

class WorkoutsController < ApplicationController
  def new
    @workout = Workout.generate current_user
  end

  def update
    @workout = Workout.find params[:id]
    workout_params[:measurements_attributes].each do |_, measurement_params|
      measurement = Measurement.find(measurement_params.delete :id)
      measurement.update_attributes measurement_params
    end
    if @workout.save
      redirect_to @workout
    else
      render :new
    end
  end

  def show
    @workout = Workout.find params[:id]
  end

  private
  def workout_params
    params.require(:workout).permit measurements_attributes: [:id, :unit, :value]
  end

end

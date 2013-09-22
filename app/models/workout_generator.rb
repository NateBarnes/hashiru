class WorkoutGenerator
  attr_accessor :user

  def initialize user
    @user = user
  end

  def generate
    exercises = []
    total_time = 0
    until exercises.size == 5 or total_time > 30
      exercise = Efficacy.top_ten(:user => user).load.sample
      exercises << exercise
      total_time += (exercise.time || 30)
    end

    exercises
  end
end

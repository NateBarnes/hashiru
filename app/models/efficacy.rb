class Efficacy
  attr_accessor :exercise, :user

  def initialize exercise, user=nil
    @exercise = exercise
    @user = user
  end

  def score type="general"
    if user
      retrieve_user_score
    else
      retrieve_general_score
    end
  end

private
  def retrieve_general_score
    GeneralEfficacy.find_by_exercise_id exercise.id
  end
end
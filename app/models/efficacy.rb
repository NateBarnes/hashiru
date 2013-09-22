class Efficacy
  attr_accessor :exercise, :user

  def self.score_array arr
    sum = arr.inject{|sum,x| sum + x }
    ((sum/Float(arr.size))*100)
  end

  def self.convert_to_percentages hsh
    new_hash = {}

    storage = {}
    hsh.fetch(:speed, {}).map do |exercise_id,value|
      storage.merge!({exercise_id => Efficacy.score_array(value) })
    end
    new_hash[:speed] = storage
    storage = {}
    hsh.fetch(:distance, {}).map do |exercise_id,value|
      storage.merge!({exercise_id => Efficacy.score_array(value) })
    end
    new_hash[:distance] = storage
    storage = {}
    hsh.fetch(:speed, {}).map do |exercise_id,value|
      storage.merge!({exercise_id => Efficacy.score_array(value + hsh.fetch(:distance, {}).fetch(exercise_id, [])) })
    end
    new_hash[:general] = storage

    new_hash
  end

  def self.top_ten user=nil
    
  end

  def initialize exercise, user=nil
    @exercise = exercise
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

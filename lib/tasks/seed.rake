namespace :seed do

  task all: ["exercises", "users"]

  desc 'Seed Exercise'
  task :exercises => :environment do
    exercises = [
      { :name => "Long Slow Run", :time => 60, :units => '["miles","minutes"]', :instructions => "Keep this run at a conversational pace. The strides should be run at 95% effort after the run with a full recovery between." },
      { :name => "Pull Ups", :time => 5, :units => '["reps"]', :instructions => "Stand below pull-up bar and grasp it with wide overhand grip. Hang on bar. Bend your knees and cross your lower legs. Pull your body up until your upper chest reaches the bar. Look up and keep chest up, leading toward the bar. Return with same speed. Keep the arms very slightly bent at the bottom of the motion to maintain the muscular activity. Simultaneously let your your shoulders be pulled up by the bodyweight. Repeat." },
      { :name => "Push Ups", :time => 5, :units => '["reps"]', :instructions => "Keeping body straight, lower body to floor by bending arms. Push body up until arms are extended. Repeat." },
      { :name => "Sit Ups", :time => 5, :units => '["reps"]', :instructions => "Have your knees bent and the balls of your feet and heels placed flat on the ground. Place your hands on opposing shoulders, so that your arms are crossed over your chest, or behind your head. This allows you a central rising point. Tighten your abdominal muscles gently by drawing in your belly button to your spine. Keeping your heels on the ground and your toes flat to the ground, slowly and gently lift your head first, followed by your shoulder blades. Focus your eyes on your bent knees, all the while gently contracting the abdominal muscles. Pull up from the floor until you're at a ninety-degree angle, or when the elbows are on, or past, the knees. Hold the position for a second. Slowly bring the torso back to the floor but try to keep it slightly elevated off the ground. This means not to place your back flat to the ground but to keep a slight, yet relaxed, arch." },
      { :name => "Squats", :time => 5, :units => '["reps"]', :instructions => "Stand with your head facing forward and your chest held up and out. Place your feet shoulder-width apart or slightly wider. Extend your hands straight out in front of you to help keep your balance. Sit back and down like you're sitting into an imaginary chair. Keep your head facing forward as your upper body bends forward a bit. Rather than allowing your back to round, let your lower back arch slightly as you descend. Lower down so your thighs are as parallel to the floor as possible, with your knees over your ankles. Press your weight back into your heels. Keep your body tight, and push through your heels to bring yourself back to the starting position." },
      { :name => "Long Slow Biking", :time => 60, :units => '["miles","minutes"]', :instructions => "Keep this trip at a conversational pace. The RPM should be at 95% effort after the trip with a full recovery between." },
      { :name => "Speed Biking", :time => 60 },
      { :name => "Indoor Cycling" },
      { :name => "Indoor Rowing" },
      { :name => "Swim" },
      { :name => "Pool Running" },
      { :name => "Ecliptical Machine Training" },
      { :name => "Hands-Up Lunge" },
      { :name => "Plank Flip" },
      { :name => "Single-Leg Squat" },
      { :name => "Swim workout" },
      { :name => "Core workout 1" },
      { :name => "Core Workout 2" },
      { :name => "16x400m" },
      { :name => "10x800" },
      { :name => "Overhead Lunge" },
      { :name => "Mixed-Grip Chinup" },
      { :name => "Scorpion" },
      { :name => "Sprints" }
    ]

    exercises.each do |exercise|
      Exercise.create exercise
    end
  end

  desc 'Seed Users'
  task :users => :environment do
    users = [
      { :name => "Jacob", :gender => "male", :longest_distance => 3.1, :mile_time => 540_000 },
      { :name => "Sophia", :gender => "female", :longest_distance => 3.1, :mile_time => 570_000 },
      { :name => "Mason", :gender => "male", :longest_distance => 5.2, :mile_time => 360_000 },
      { :name => "Emma", :gender => "female", :longest_distance => 5.2, :mile_time => 390_000 },
      { :name => "Ethan", :gender => "male", :longest_distance => 13.1, :mile_time => 430_000 },
      { :name => "Isabella", :gender => "female", :longest_distance => 13.1, :mile_time => 470_000 },
      { :name => "Noah", :gender => "male", :longest_distance => 26.2, :mile_time => 500_000 },
      { :name => "Olivia", :gender => "female", :longest_distance => 26.2, :mile_time => 510_000 },
      { :name => "William", :gender => "male", :longest_distance => 50, :mile_time => 600_000 },
      { :name => "Ava", :gender => "female", :longest_distance => 50, :mile_time => 640_000 },
      { :name => "Liam", :gender => "male", :longest_distance => 1, :mile_time => 720_000 },
      { :name => "Emily", :gender => "female", :longest_distance => 1, :mile_time => 760_000 },
      { :name => "Jayden", :gender => "male", :longest_distance => 0.2, :mile_time => 1_200_000 },
      { :name => "Abigail", :gender => "female", :longest_distance => 0.2, :mile_time => 1_200_000 },
      { :name => "Michael", :gender => "male", :longest_distance => 3.9, :mile_time => 460_000 },
      { :name => "Mia", :gender => "female", :longest_distance => 4.3, :mile_time => 490_000 },
      { :name => "Alexander", :gender => "male", :longest_distance => 5.3, :mile_time => 430_000 },
      { :name => "Madison", :gender => "female", :longest_distance => 4.8, :mile_time => 450_000 },
      { :name => "Aiden", :gender => "male", :longest_distance => 18.8, :mile_time => 400_000 },
      { :name => "Elizabeth", :gender => "female", :longest_distance => 16.4, :mile_time => 415_000 }
    ]

    users.each do |user|
      User.create user
    end
  end

end


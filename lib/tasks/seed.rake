namespace :seed do

  task all: ["exercises", "users", "clusters", "workouts"]

  desc 'Seed Exercise'
  task :exercises => :environment do
    exercises = [
      { :name => "Long Slow Run", :time => 60, :units => '["miles","minutes"]', :instructions => "Keep this run at a conversational pace. The strides should be run at 95% effort after the run with a full recovery between." },
      { :name => "Pull Ups", :time => 5, :units => '["reps"]', :instructions => "Stand below pull-up bar and grasp it with wide overhand grip. Hang on bar. Bend your knees and cross your lower legs. Pull your body up until your upper chest reaches the bar. Look up and keep chest up, leading toward the bar. Return with same speed. Keep the arms very slightly bent at the bottom of the motion to maintain the muscular activity. Simultaneously let your your shoulders be pulled up by the bodyweight. Repeat." },
      { :name => "Push Ups", :time => 5, :units => '["reps"]', :instructions => "Keeping body straight, lower body to floor by bending arms. Push body up until arms are extended. Repeat." },
      { :name => "Sit Ups", :time => 5, :units => '["reps"]', :instructions => "Have your knees bent and the balls of your feet and heels placed flat on the ground. Place your hands on opposing shoulders, so that your arms are crossed over your chest, or behind your head. This allows you a central rising point. Tighten your abdominal muscles gently by drawing in your belly button to your spine. Keeping your heels on the ground and your toes flat to the ground, slowly and gently lift your head first, followed by your shoulder blades. Focus your eyes on your bent knees, all the while gently contracting the abdominal muscles. Pull up from the floor until you're at a ninety-degree angle, or when the elbows are on, or past, the knees. Hold the position for a second. Slowly bring the torso back to the floor but try to keep it slightly elevated off the ground. This means not to place your back flat to the ground but to keep a slight, yet relaxed, arch." },
      { :name => "Squats", :time => 5, :units => '["reps"]', :instructions => "Stand with your head facing forward and your chest held up and out. Place your feet shoulder-width apart or slightly wider. Extend your hands straight out in front of you to help keep your balance. Sit back and down like you're sitting into an imaginary chair. Keep your head facing forward as your upper body bends forward a bit. Rather than allowing your back to round, let your lower back arch slightly as you descend. Lower down so your thighs are as parallel to the floor as possible, with your knees over your ankles. Press your weight back into your heels. Keep your body tight, and push through your heels to bring yourself back to the starting position." },
      { :name => "Long Slow Biking", :time => 60, :units => '["miles","minutes"]', :instructions => "Keep this trip at a conversational pace. The RPM should be at 95% effort after the trip with a full recovery between." },
      { :name => "Speed Biking", :time => 60, :units => '["miles", "minutes"]', :instructions => "Speed workout for 25 mile: 5 min fast, 1 min slow, repeat."},
      { :name => "Indoor Cycling", :time => 35, :units => '["miles", "minutes"]', :instructions => "35 min. Warm up: 10 mins. of cycling, including two 30-sec. intervals at high intensity and effort. Main Set: 10 sets of 1 min. of hard cycling followed by 1 min. of easy/recovery cycling, for a total of 10 mins. of hard cycling and 10 mins. of recovery. Do the hard efforts at the max resistance and speed you can maintain. Spin with minimal resistance to recover."},
      { :name => "Indoor Rowing", :time => 30, :units => '["reps"]', :instructions => "Warm-up: 10 mins. of rowing, including two 30-sec. intervals at high intensity and effort. Main Set: 10 sets of 1 min. of hard rowing followed by 1 min. of easy/recovery rowing, for a total of 10 mins. of hard rowing and 10 mins. of recovery. Do the hard rows at your max sustainable effort. Remember to use your legs and maintain good form. Row lightly with minimal resistance to recover."},
      { :name => "Swim", :time => 60, :units => '["reps"]', :instructions => "1,500 yards (60 lengths or 30 laps). Warm-up: 10 sets of 50 yards (one lap) of easy swimming, focusing on your form and comfort (total of 500 yards). Main Set: 5 sets of 150 yards. Swim 100 yards steady and 50 yards easy. This is an endurance set, your goal is to maintain similar effort across all of the repeats. Use each of the easy 50-yard swims for recovery, and take as much time as you need on the wall to rest between efforts."},
      { :name => "Pool Running", :time => 30, :units => '["reps"]', :instructions => "Warm-up: 5 mins. of building effort, from easy to steady. Main Set: 4 sets of 5-min. continuous intervals. Each 5-min. interval is divided thusly: 2 mins. of steady effort, at a sustained pace, 2 mins. at a faster pace, pumping the knees and arms underwater, 1 min. of easy recovery. Cool Down: 5 min. of easy effort."},
      { :name => "Ecliptical Machine Training", :units => '["reps"]', :instructions => "Warm-up: 10 mins. at an easy level. Build effort from easy to steady using controls. Main Set: 2 sets of 12 mins., with 3 mins. of rest after each set. Each 12-min. interval is divided into two 6-min. sections: 4 mins. at steady endurance pace, 2 mins. at a steady hill climb. Cool Down: 5 mins. of easy effort."},
      { :name => "Hands-Up Lunge", :time => 5, :units => '["reps"]', :instructions => "Stand with feet hip-width apart, arms overhead, palms facing each other. Lunge forward with left leg, bending knees 90 degrees. Step back to start position; switch legs and repeat. Do 20 reps, alternating legs."},
      { :name => "Plank Flip", :time => 5, :units => '["reps"]', :instructions => "Start in plank. Lift right leg; lower. Lift left leg; lower. Do 5 reps each side.Flip over to face up, legs together and extended, arms bent by sides, forearms on floor, torso lifted. Lift hips a few inches. Lift right leg; lower. Lift left leg; lower. Do 5 reps each side."},
      { :name => "Single-Leg Squat", :time => 8, :units => '["reps"]', :instructions => "Stand with feet hip-width apart, arms by sides. Lift right foot a few inches behind you and squat as you lift extended arms to shoulder level in front of you. Straighten left leg and lower arms. Do 10 reps, keeping right foot lifted. Switch legs; repeat."},
      { :name => "Swim workout", :time => 45, :units => '["reps"]', :instructions => "WARM UP: 100 easy swim, 100 balanced swim kick, 100 easy swim   MAIN SET: 6 X 50's smooth swim on :15 rest  SECONDARY SET:300 swim, 300 pull (paddles and buoy). WARM DOWN SET:1 x 200 smooth freestyle." },
      { :name => "Core: Bridge", :time => 5, :units => '["reps"]', :instructions => "Lie on your back with your feet flat on the ground. Lift your hips so there is a straight line from your shoulders to your knees. Extend one leg straight out, hold for several seconds, then put it back down on the ground and repeat. Make sure your hips don't dip and don't allow your butt to sag to the ground."},
      { :name => "Core: Side Plank", :time => 6, :units => '["reps"]', :instructions => "On your side, lift your body so your weight is resting on one forearm and the side of one foot. There should be a straight diagonal line from your head to your feet. I usually do 10 lateral leg raises during this exercise as an advanced form of the exercise." },
      { :name => "16x400m", :time => 60, :units => '["miles", "minutes"]',:instructions => "2 miles slow, 16 x 400 fast w/45 sec rest, 1 mile slow. Fast is 7:00 - 7:15 per mile."},
      { :name => "10x800", :time => 70, :units => '["miles", "minutes"]', :instructions => "2 miles slow, 10 x 800 fast w/1min rest, 1 mile slow Fast is 7:05 - 7:20 pace per mile." },
      { :name => "Overhead Lunge", :time => 5, :units => '["reps"]', :instructions => "Hold a pair of dumbbells straight above your shoulders, your arms straight and elbows locked [1]. Step forward with your left leg and lower your body until your front knee is bent 90 degrees [2]. Return to the starting position, and repeat with your right leg. That's one repetition. Modification: To make it easier, hold dumbbells at shoulder level. Repetitions: six to eight (each leg) Muscles worked: quadriceps, hamstrings, glutes, shoulders, core."},
      { :name => "Mixed-Grip Chinup", :time => 10, :units => '["reps"]', :instructions => "Grab the chinup bar overhand with your left hand, and underhand with your right, and hang with your arms completely straight [1]. Pull yourself as high as you can without allowing your body to rotate [2]. Alternate grips each  set.Modification: To make it easier, place a bench underneath the bar. Jump up to the top position, then lower yourself slowly. Repetitions: six to eight Muscles worked: back, biceps, core."},
      { :name => "Scorpion", :time => 10, :units => '["reps"]', :instructions => "Get into pushup position, but with your feet on a bench [1]. Raise your right knee toward your left shoulder as you rotate your hips up and to the left as far as you can [2]. Then reverse directions, rotating your hips up and to the right, and try to touch your right foot to the back of your left shoulder (you won't be able to do it) [3]. That's one repetition. Continue for 30 seconds with your right leg, then switch legs. Modifications: To make it easier, do step one of the exercise, twisting in just one direction. To make it harder, instead of putting your feet on a bench, do the exercise with your shins on a stability ball. Repetitions: As many as you can in 30 seconds Muscles worked: shoulders, core."},
      { :name => "Sprints", :time => 50, :units => '["miles", "minutes"]', :instructions => "Fast pace is 9:50/mi to 10:00/mi.  Splitting up the run lets you run faster and maintain a tempo effort."},
      { :name => "Fast 1 Mile", :time => 15, :units => '["miles", "minutes"]', :instructions => "Run 1 mile as fast as you can. The faster you run the more time you have left to rest. Target is under 7mpm."}
    ]
    Exercise.delete_all # removes previously seeded exercises
    exercises.each do |exercise|
      Exercise.create! exercise
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
      User.create! user
    end
  end

  desc "Seed Clusters"
  task :clusters => :environment do
    generator = UserClusterGenerator.new

    User.all.each do |user|
      cluster = generator.perform user.gender_num, user.mile_time, user.longest_distance
      user.cluster = cluster
      user.save!
    end
  end

  desc 'Seed Workouts'
  task :workouts => :environment do

  end

end

namespace :delete_me do
  desc 'Seed Test Data'
  task :seed_test => :environment do
    start_workout = Workout.create :user_id => User.first.id, :day => Time.now - 4.weeks
    middle_workout = Workout.create :user_id => User.first.id, :day => Time.now - 3.weeks
    end_workout = Workout.create :user_id => User.first.id, :day => Time.now - 2.weeks

    we1 = start_workout.workout_exercises.create :exercise_id => Exercise.speed_run.id
    we1.measurements.create :unit => "miles", :value => 1
    we1.measurements.create :unit => "minutes", :value => 2

    we1 = start_workout.workout_exercises.create :exercise_id => Exercise.distance_run.id
    we1.measurements.create :unit => "miles", :value => 2
    we1.measurements.create :unit => "minutes", :value => 2

    we2 = middle_workout.workout_exercises.create :exercise_id => 5
    we2.measurements.create :unit => "miles", :value => 1
    we2.measurements.create :unit => "minutes", :value => 2

    we3 = end_workout.workout_exercises.create :exercise_id => Exercise.speed_run.id
    we3.measurements.create :unit => "miles", :value => 2
    we3.measurements.create :unit => "minutes", :value => 1

    we3 = end_workout.workout_exercises.create :exercise_id => Exercise.distance_run.id
    we3.measurements.create :unit => "miles", :value => 1
    we3.measurements.create :unit => "minutes", :value => 1
  end
end


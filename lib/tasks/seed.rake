namespace :seed do

  task all: ["users", "workouts"]

  desc 'Seed Workouts'
  task :workouts => :environment do
    workouts = {
      
    }
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


require "rails_helper"

RSpec.feature "Listing Exercises" do
    before do
        @joe = User.create(first_name: "Joe", last_name: "Bloggs", email: "joe@example.com", password: "password")
        login_as(@joe)
        
        @e1 = @joe.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: Date.today)
        @e2 = @joe.exercises.create(duration_in_min: 20, workout: "Cardio", workout_date: Date.today)
    end
end
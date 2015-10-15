require "rails_helper"

RSpec.feature "Listing Exercises" do
    before do
        @joe = User.create(first_name: "Joe", last_name: "Bloggs", email: "joe@example.com", password: "password")
        login_as(@joe)
        
        @e1 = @joe.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: Date.today)
        @e2 = @joe.exercises.create(duration_in_min: 20, workout: "Cardio", workout_date: Date.today)
    end
    
    scenario "Show user's workouts for the last 7 days" do
        visit "/"
    
        click_link "My Lounge"
        expect(page).to have_content(@e1.duration_in_min)
        expect(page).to have_content(@e1.workout)
        expect(page).to have_content(@e1.workout_date)
        expect(page).to have_content(@e2.duration_in_min)
        expect(page).to have_content(@e2.workout)
        expect(page).to have_content(@e2.workout_date)
    end
end
require "rails_helper"

RSpec.feature "Showing Friend Workout" do
  before do
    @joe = User.create(first_name: "Joe", last_name: "Bloggs", email: "joe@example.com", password: "password")
    @jack = User.create(first_name: "Jack", last_name: "Black", email: "jack@example.com", password: "password")
  
    @e1 = @joe.exercises.create(duration_in_min: 74, workout: "Weight lifting routine", 
      workout_date: Date.today)
    @e2 = @jack.exercises.create(duration_in_min: 55, workout: "Sarahs weight lifting routine", 
      workout_date: Date.today)
    login_as(@joe)
    @following = Friendship.create(user: @joe, friend: @jack)
  end
  
  scenario "shows friend's workout for last 7 days" do
    visit "/"
    
    click_link "My Lounge"
    click_link @jack.full_name
    
    expect(page).to have_content(@jack.full_name + "'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end
end  
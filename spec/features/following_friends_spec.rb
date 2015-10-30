require "rails_helper"

RSpec.feature "Following Friends" do
  before do
    @joe = User.create(first_name: "Joe", last_name: "Bloggs", email: "joe@example.com", password: "password")
    @jim = User.create(first_name: "Jim", last_name: "Beam", email: "jim@example.com", password: "password")
    
    login_as(@joe)
  end
  
  scenario "if signed in succeeds" do
    visit "/"
    
    expect(page).to have_content(@joe.full_name)
    expect(page).to have_content(@jim.full_name)
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@joe.id}")
    
    link = "a[href='/friendships?friend_id=#{@jim.id}']"
    find(link).click
    
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@jim.id}")
  end  
end
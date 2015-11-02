require "rails_helper"

RSpec.feature "Unfollowing Friend" do
  before do
    @joe = User.create(first_name: "Joe", last_name: "Bloggs", email: "joe@example.com", password: "password")
    @jack = User.create(first_name: "Jack", last_name: "Black", email: "jack@example.com", password: "password")
    
    login_as(@joe)
    
    @following = Friendship.create(user: @joe, friend: @jack)
  end
  
  scenario do
    visit "/"
    click_link "My Lounge"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click
    
    expect(page).to have_content(@jack.full_name + " unfollowed")
  end
end
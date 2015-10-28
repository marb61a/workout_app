require "rails_helper"

RSpec.feature "Searching for User" do
  before do
    @joe = User.create(first_name: "Joe", last_name: "Bloggs", email: "joe@example.com",
      password: "password")
    @jack = User.create(first_name: "Jack", last_name: "Daniels", email: "jack@example.com",
      password: "password")
  end
  
  scenario "with existing name returns all those users" do
    visit "/"
    
    fill_in "search_name", with: "Doe"
    click_button "Search"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(current_path).to eq("/dashboard/search")
  end
end
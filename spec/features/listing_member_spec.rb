require "rails_helper"

RSpec.feature "Listing Members" do
    before do
        @joe = User.create(first_name: "Joe", last_name: "Bloggs", email: "joe@example.com",
          password: "password")
        @jack = User.create(first_name: "Jack", last_name: "Daniels", email: "jack@example.com",
          password: "password")
    end
    
    scenario 'shows a list of registered members' do
        visit "/"
        expect(page).to have_content("List of Members")
        expect(page).to have_content(@joe.full_name)
        expect(page).to have_content(@jack.full_name)
    end
    
end


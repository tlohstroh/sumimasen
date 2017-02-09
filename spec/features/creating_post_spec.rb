# https://github.com/teamcapybara/capybara

require "rails_helper"

# test doesn't fully work yet because of authentication issues..
# TODO make it work



RSpec.feature "Creating Articles" do

  before do
    @john = User.create!(email: "me@example.com", password: "password")
    login_as(@john)
  end

  # (scenario = capybara)
  scenario "A user creates a new article" do
    # visit root page
    visit "/articles"
    # click on new Article
    click_link 'New'
    # fill in title
    fill_in "Title", with: "Creating a blog"
    # fill in body
    fill_in "Text", with: "Lorem Ipsum"
    # create Article
    click_button "Create"

    #### expextations ###
    # Article has been created
    expect(page).to have_content("Article has been created")

  end
end

# https://github.com/teamcapybara/capybara

require "rails_helper"

# test doesn't fully work yet because of authentication issues..
# TODO make it work

RSpec.feature "Creating Articles" do
  before do
    @tjitske = User.create(email: "tjitske@example.com", password: "password")
    login_as(@tjitske)
  end

  # (scenario = capybara)
  scenario "A user creates a new article" do
    # visit root page
    visit "/articles"
    # click on new Article
    click_on 'New'
    # fill in title
    fill_in "Title", with: "Creating a blog"
    # fill in body
    fill_in "Body", with: "Lorem Ipsum"
    # create Article
    click_button "Create"

    #### expextations ###
    # Article has been created
    expect(page).to have_content("Article has been created")
    # articles path
    expect(page.current_path).to eq(articles_path)
  end
end

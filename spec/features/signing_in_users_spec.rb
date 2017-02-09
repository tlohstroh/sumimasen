require "rails_helper"

RSpec.feature "Users signup" do

  before do
    @john = User.create!(email: "me@example.com", password: "password")
  end

  scenario "with valid credentials" do
  visit "/users/sign_in"
  fill_in "Email", with: "me@example.com"
  fill_in "Password", with: "password"
  click_button "Log in"
  expect(page).to have_content("Signed in successfully.")
  expect(page).to have_content("Logout")
  end

  scenario "with invalid credentials" do
  visit "/users/sign_in"
  fill_in "Email", with: ""
  fill_in "Password", with: ""
  click_button "Log in"
  expect(page).to have_content("Invalid Email or password.")
  expect(page).not_to have_content("Logout")
  end



end

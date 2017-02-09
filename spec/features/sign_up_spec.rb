require "rails_helper"

RSpec.feature "sign up" do

  scenario "Owner signs up as the first user" do
    visit "users/sign_up"

    fill_in "Email", with: "owne@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "Non-owner unsuccessfully tries to sign up as an exta user" do

    @owner = User.create(email: "owner@example.com", password: "password")
    visit "users/sign_up"

    expect(page).to have_content("Admin only")
    expect(page.current_path).to eq(new_user_session_path)

  end

  scenario "logged in owner tries to sign in again" do

    @owner = User.create(email: "owner@example.com", password: "password")
    login_as(@owner)
    visit "users/sign_up"

    expect(page.current_path).to eq(root_path)

  end





end

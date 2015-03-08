require 'rails_helper'

RSpec.feature "User Logs In", :type => :feature do
  scenario "with valid username and password" do
    user = User.create(username: "example", email_address: "example@example.com", password: "password")
    visit login_path
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_link_or_button "Log in"
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome to IdeaBox, example")
  end

  scenario "with invalid username" do
    user = User.create(username: "example", email_address: "example@example.com", password: "password")
    visit login_path
    fill_in "session[username]", with: "User"
    fill_in "session[password]", with: user.password
    click_link_or_button "Log in"
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid Login")
  end
end
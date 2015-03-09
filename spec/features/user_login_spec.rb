require 'rails_helper'

RSpec.feature "User Logs In", :type => :feature do
  context "as a valid default user" do
    scenario "with valid username and password" do
      user = User.create(username: "example", email_address: "example@example.com", password: "password")
      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_link_or_button "Log In"
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome to IdeaBox, example")
    end
  end

  context "as an invalid default user" do
    scenario "with invalid username" do
      user = User.create(username: "example", email_address: "example@example.com", password: "password")
      visit login_path
      fill_in "session[username]", with: "User"
      fill_in "session[password]", with: user.password
      click_link_or_button "Log In"
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Login")
    end
  
    scenario "with invalid password" do
      user = User.create(username: "example", email_address: "example@example.com", password: "password")
      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: "example"
      click_link_or_button "Log In"
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Login")
    end
  end

  context "as a valid admin" do
    scenario "is redirected to admin dashboard" do
      admin = User.create(username: "example", email_address: "example@example.com", password: "password", role: 1)
      visit login_path
      fill_in "session[username]", with: admin.username
      fill_in "session[password]", with: admin.password
      click_link_or_button "Log In"
      expect(current_path).to eq(admin_path(admin))
      expect(page).to have_content("Welcome to the Admin Control Panel")
    end

    scenario "sees a link to manage categories" do
      admin = User.create(username: "example", email_address: "example@example.com", password: "password", role: 1)
      visit login_path
      fill_in "session[username]", with: admin.username
      fill_in "session[password]", with: admin.password
      click_link_or_button "Log In"
      expect(page).to have_content("Manage Categories")
      click_link_or_button "Manage Categories"
      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Categories")
    end
      scenario "sees a link to manage images" do
      admin = User.create(username: "example", email_address: "example@example.com", password: "password", role: 1)
      visit login_path
      fill_in "session[username]", with: admin.username
      fill_in "session[password]", with: admin.password
      click_link_or_button "Log In"
      expect(page).to have_content("Manage Images")
      click_link_or_button "Manage Images"
      expect(current_path).to eq(admin_images_path)
      expect(page).to have_content("Images")
    end
  end

end
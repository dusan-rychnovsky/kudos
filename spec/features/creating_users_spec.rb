require "rails_helper"

RSpec.feature "Admins can create new users" do
  let(:admin) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(admin)
    visit "/"
    click_link "Users"
    click_link "New User"
  end

  scenario "with valid credentials" do
    fill_in "Username", with: "user"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Create User"

    expect(page).to have_content "User has been created."
  end
end

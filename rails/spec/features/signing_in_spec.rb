require "rails_helper"

RSpec.feature "Users can sign in" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, :admin) }

  scenario "as user" do
    visit "/"
    click_link "Sign in"

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Signed in as #{user.username}"
    expect(page).not_to have_content "(Admin)"
  end

  scenario "as admin" do
    visit "/"
    click_link "Sign in"

    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Signed in as #{admin.username} (Admin)"
  end
end

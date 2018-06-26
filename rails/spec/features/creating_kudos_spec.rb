require "rails_helper"

RSpec.feature "Users can create new Kudo" do
  scenario "with valid attributes" do

    visit "/"
    click_link "New Kudos"

    fill_in "From", with: "Dusan Rychnovsky"
    fill_in "To", with: "Dusan Rychnvosky"
    fill_in "For", with: "Finally deciding to learn Rails."
    click_button "Create Kudos"

    expect(page).to have_content "Kudos has been created."
  end
end

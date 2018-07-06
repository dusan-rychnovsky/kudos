require "rails_helper"

RSpec.feature "Users can edit existing kudos" do
  before do
    FactoryGirl.create(:kudo, from: "Dusan Rychnovsky", to: "Dusan Rychnovsky", for: "Starting to learn Rails.")

    visit "/"
    click_link "Starting to learn Rails."

    click_link "Edit Kudos"
  end

  scenario "with valid attributes" do
    fill_in "For", with: "Setting up to learn Rails."

    click_button "Update Kudos"

    expect(page).to have_content "Kudos has been updated."
    expect(page).to have_content "Setting up to learn Rails."
  end

  scenario "when providing invalid attributes" do
    fill_in "For", with: ""
    click_button "Update Kudos"

    expect(page).to have_content "Kudos has not been updated."
  end
end

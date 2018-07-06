require "rails_helper"

RSpec.feature "Users can delete kudos" do
  scenario "successfully" do
    FactoryGirl.create(:kudo, from: "Dusan Rychnovsky", to: "Dusan Rychnovsky", for: "Starting to learn Rails.")

    visit "/"
    click_link "Starting to learn Rails."

    click_link "Delete Kudos"

    expect(page).to have_content "Kudos has been deleted."
    expect(page.current_url).to eq kudos_url
    expect(page).to have_no_content "Starting to learn Rails."
  end
end

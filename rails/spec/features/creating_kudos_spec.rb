require "rails_helper"

RSpec.feature "Users can create new Kudo" do

  before do
    visit "/"
    click_link "New Kudos"
  end

  scenario "with valid attributes" do
    fill_in "From", with: "Dusan Rychnovsky"
    fill_in "To", with: "Dusan Rychnvosky"
    fill_in "For", with: "Finally deciding to learn Rails."
    click_button "Create Kudos"

    expect(page).to have_content "Kudos has been created."

    kudo = Kudo.find_by(for: "Finally deciding to learn Rails.")
    expect(page.current_url).to eq kudo_url(kudo)

    title = "Kudos - Finally deciding to learn Rails."
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Kudos"

    expect(page).to have_content "Kudos has not been created."
    expect(page).to have_content "From can't be blank"
    expect(page).to have_content "To can't be blank"
    expect(page).to have_content "For can't be blank"
  end
end

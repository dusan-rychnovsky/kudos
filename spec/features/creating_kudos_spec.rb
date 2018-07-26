require "rails_helper"

RSpec.feature "Users can create new Kudo" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:to) { FactoryGirl.create(:user) }

  before do
    login_as(user)
    visit "/"
  end

  scenario "with valid attributes" do
    click_link "Give Kudos"

    select to.username, from: "To"
    fill_in "For", with: "Finally deciding to learn Rails."
    click_button "Give Kudos"

    expect(page).to have_content "Kudos has been created."
    kudo = Kudo.find_by(for: "Finally deciding to learn Rails.")
    expect(page).to have_content "To #{to.username}:"
    expect(page).to have_content "#{user.username}"
    expect(page).to have_content "Kudos for #{kudo.for}"
  end

  scenario "when providing invalid attributes" do
    click_link "Give Kudos"
    click_button "Give Kudos"

    expect(page).to have_content "Kudos has not been created."
    expect(page).to have_content "To must exist"
    expect(page).to have_content "For can't be blank"
  end

  scenario "from user listing page" do
    click_link to.username
    click_link "Give Kudos"

    fill_in "For", with: "A nice kudos."
    click_button "Give Kudos"

    expect(page).to have_content "Kudos has been created"
    expect(page).to have_content "To #{to.username}"
    expect(page).to have_content "A nice kudos."
  end
end

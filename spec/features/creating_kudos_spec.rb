require "rails_helper"

RSpec.feature "Users can create new Kudo" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:to) { FactoryGirl.create(:user) }

  before do
    login_as(user)
    visit "/"
    click_link "Give Kudos"
  end

  scenario "with valid attributes" do
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
    click_button "Give Kudos"

    expect(page).to have_content "Kudos has not been created."
    expect(page).to have_content "To must exist"
    expect(page).to have_content "For can't be blank"
  end
end
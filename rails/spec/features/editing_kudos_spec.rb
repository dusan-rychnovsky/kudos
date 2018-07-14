require "rails_helper"

RSpec.feature "Users can edit existing kudos" do
  let(:user) { FactoryGirl.create(:user) }
  let(:to) { FactoryGirl.create(:user) }
  let!(:kudo) { FactoryGirl.create(:kudo, from: user, to: to, for: "Setting up to learn Railz.") }

  before do
    visit "/"
    click_link kudo.for

    click_link "Edit Kudos"
  end

  scenario "with valid attributes" do
    fix = "Setting up to learn Rails."
    fill_in "For", with: fix

    click_button "Update Kudos"

    expect(page).to have_content fix
    expect(page).to have_content "Setting up to learn Rails."
  end

  scenario "when providing invalid attributes" do
    fill_in "For", with: ""
    click_button "Update Kudos"

    expect(page).to have_content "Kudos has not been updated."
  end
end

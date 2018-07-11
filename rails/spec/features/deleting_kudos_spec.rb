require "rails_helper"

RSpec.feature "Users can delete kudos" do
  let(:from) { FactoryGirl.create(:user) }
  let!(:kudo) { FactoryGirl.create(:kudo, from: from) }

  scenario "successfully" do
    visit "/"
    click_link kudo.for

    click_link "Delete Kudos"

    expect(page).to have_content "Kudos has been deleted."
    expect(page.current_url).to eq kudos_url
    expect(page).to have_no_content kudo.for
  end
end

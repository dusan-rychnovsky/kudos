require "rails_helper"

RSpec.feature "Admins can delete kudos" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:alice) { FactoryGirl.create(:user) }
  let(:bob) { FactoryGirl.create(:user) }
  let!(:kudo) { FactoryGirl.create(:kudo, from: alice, to: bob)}

  scenario "" do
    login_as(admin)
    visit "/"
    click_link bob.username
    click_link "Delete"

    expect(page).to have_content "Kudos has been deleted."
    expect(page).not_to have_content kudo.for
  end
end

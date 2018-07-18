require "rails_helper"

RSpec.feature "Admins can delete existing users" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:user) { FactoryGirl.create(:user)}

  scenario "" do
    login_as(admin)
    visit "/"
    click_link "Users"
    click_link("Delete", match: :first)

    expect(page).to have_content "User has been deleted."
    expect(page).not_to have_content user.username
  end
end

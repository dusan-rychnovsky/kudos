require "rails_helper"
require "email_helper"

RSpec.feature "Admin can send email invitations" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(admin)
    visit "/"
    click_link "Users"
  end

  scenario "" do
    click_link("Invite", match: :first)

    expect(page).to have_content "Invitation has been sent."

    email = find_email!(user.email)
    expect(email.subject).to eq "Wellcome to KudosCounter!"

    click_first_link_in_email(email)
    expect(current_path).to eq root_path


  end
end

require "rails_helper"

RSpec.feature "Users can view kudos" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:kudo) { FactoryGirl.create(:kudo, from: user) }

  scenario "with the kudos details" do 
    visit "/"
    click_link kudo.for
    expect(page.current_url).to eq kudo_url(kudo)
    expect(page).to have_content("From: #{user.username}")
    expect(page).to have_content("To: #{kudo.to}")
    expect(page).to have_content("For: #{kudo.for}")
  end
end

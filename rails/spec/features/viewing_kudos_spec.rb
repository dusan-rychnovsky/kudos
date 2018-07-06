require "rails_helper"

RSpec.feature "Users can view kudos" do
  scenario "with the kudos details" do 
    kudo = FactoryGirl.create(:kudo, from: "Dusan Rychnovsky", to: "Dusan Rychnovsky", for: "Starting to learn Rails.")
    
    visit "/"
    click_link "Starting to learn Rails"
    expect(page.current_url).to eq kudo_url(kudo)
  end
end

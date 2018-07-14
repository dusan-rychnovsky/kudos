require "rails_helper"

RSpec.feature "Users can view kudos" do
  let(:alice) { FactoryGirl.create(:user) }
  let(:bob) { FactoryGirl.create(:user) }
  let(:cecilia) { FactoryGirl.create(:user) }
  let!(:kudo1) { FactoryGirl.create(:kudo, from: alice, to: bob, for: "Kudos 1.") }
  let!(:kudo2) { FactoryGirl.create(:kudo, from: alice, to: bob, for: "Kudos 2.") }
  let!(:kudo3) { FactoryGirl.create(:kudo, from: bob, to: alice, for: "Kudos 3.") }
  let!(:kudo4) { FactoryGirl.create(:kudo, from: cecilia, to: bob, for: "Kudos 4.") }
  let!(:kudo5) { FactoryGirl.create(:kudo, from: cecilia, to: alice, for: "Kudos 5.") }

  scenario "grouped by reciever" do 
    visit "/"
    click_link bob.username

    expect(page).to have_content("To #{bob.username}:")
    [kudo1, kudo2, kudo4].each do |kudo|
      expect(page).to have_content("Kudos for #{kudo.for}")
    end
    [kudo3, kudo5].each do |kudo|
      expect(page).not_to have_content("Kudos for #{kudo.for}")
    end
  end
end

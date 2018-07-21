require "rails_helper"

RSpec.describe InvitationMailer, type: :mailer do
  describe "invited" do
    let(:user) { FactoryGirl.create(:user) }
    let(:email) do
      InvitationMailer.invited(user)
    end

    it "sends out an email invitation" do
      expect(email.to).to include user.email
      expect(email.body.to_s).to include "Hello #{user.username},"
    end
  end
end

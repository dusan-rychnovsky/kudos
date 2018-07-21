class InvitationMailer < ApplicationMailer
  def invited(user)
    @user = user
    subject = "Wellcome to KudosCounter!"
    mail(to: user.email, subject: subject)
  end
end

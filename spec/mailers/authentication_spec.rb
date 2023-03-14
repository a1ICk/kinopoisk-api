require "rails_helper"

RSpec.describe AuthenticationMailer, type: :mailer do
  describe "user_login" do
    let(:mail) { AuthenticationMailer.user_login }

    it "renders the headers" do
      expect(mail.subject).to eq("User login")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end

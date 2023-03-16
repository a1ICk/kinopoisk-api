require "rails_helper"

RSpec.describe RegistrationMailer, type: :mailer do
  describe "user_created" do
    let(:mail) { RegistrationMailer.user_created }

    it "renders the headers" do
      expect(mail.subject).to eq("User created")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end

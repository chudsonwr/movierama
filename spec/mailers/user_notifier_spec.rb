require "rails_helper"

RSpec.describe UserNotifier, :type => :mailer do
  describe "send_notification_email" do
    let(:mail) { UserNotifier.send_notification_email('to@example.org', 'User1', 'Film1') }

    it "renders the headers" do
      expect(mail.subject).to eq("You have a new vote on one of your movies")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["no-reply@movieama.dev"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("<!DOCTYPE html>\r\n<html>\r\n  <head>\r\n    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />\r\n  </head>\r\n  <body>\r\n    <h1>You've got a new vote from User1!</h1>\r\n  </p>\r\n    <p>User1 has voted on your movie, Film1 </p>\r\n  </body>\r\n</html>")
    end
  end
end
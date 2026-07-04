require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "welcome_message" do
    mail = UserMailer.welcome_message
    assert_equal "Bienvenue chez Solstice !!", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_match "Hi", mail.body.encoded
  end

end

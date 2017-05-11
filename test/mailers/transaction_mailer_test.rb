require 'test_helper'

class TransactionMailerTest < ActionMailer::TestCase
  test "conversation_payed" do
    mail = TransactionMailer.conversation_payed
    assert_equal "Conversation payed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

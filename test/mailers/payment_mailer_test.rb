require 'test_helper'

class PaymentMailerTest < ActionMailer::TestCase
  test "lead_registration" do
    mail = PaymentMailer.lead_registration
    assert_equal "Lead registration", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

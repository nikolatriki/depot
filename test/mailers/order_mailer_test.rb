require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Order Confirmation", mail.subject
    assert_equal ["goran@example.org"], mail.to
    assert_equal ["ristonekoj@gmail.com"], mail.from
    assert_match /Thank you for your recent order from The Arsov Winery Online Store./, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Order Shipped", mail.subject
    assert_equal ["goran@example.org"], mail.to
    assert_equal ["ristonekoj@gmail.com"], mail.from
    assert_match "Thank you for shopping with us!", mail.body.encoded
  end

end

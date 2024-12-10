require 'rails_helper'

RSpec.describe "order_payments/index", type: :view do
  before(:each) do
    assign(:order_payments, [
      OrderPayment.create!(
        amount: "9.99",
        payment_method: 2,
        order: nil
      ),
      OrderPayment.create!(
        amount: "9.99",
        payment_method: 2,
        order: nil
      )
    ])
  end

  it "renders a list of order_payments" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end

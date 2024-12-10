require 'rails_helper'

RSpec.describe "order_payments/edit", type: :view do
  let(:order_payment) {
    OrderPayment.create!(
      amount: "9.99",
      payment_method: 1,
      order: nil
    )
  }

  before(:each) do
    assign(:order_payment, order_payment)
  end

  it "renders the edit order_payment form" do
    render

    assert_select "form[action=?][method=?]", order_payment_path(order_payment), "post" do

      assert_select "input[name=?]", "order_payment[amount]"

      assert_select "input[name=?]", "order_payment[payment_method]"

      assert_select "input[name=?]", "order_payment[order_id]"
    end
  end
end

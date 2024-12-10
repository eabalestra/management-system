require 'rails_helper'

RSpec.describe "order_payments/new", type: :view do
  before(:each) do
    assign(:order_payment, OrderPayment.new(
      amount: "9.99",
      payment_method: 1,
      order: nil
    ))
  end

  it "renders new order_payment form" do
    render

    assert_select "form[action=?][method=?]", order_payments_path, "post" do

      assert_select "input[name=?]", "order_payment[amount]"

      assert_select "input[name=?]", "order_payment[payment_method]"

      assert_select "input[name=?]", "order_payment[order_id]"
    end
  end
end

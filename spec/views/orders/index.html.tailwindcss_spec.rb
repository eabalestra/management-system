require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        total_amount: "9.99",
        payment_status: 2,
        user: nil,
        client: nil
      ),
      Order.create!(
        total_amount: "9.99",
        payment_status: 2,
        user: nil,
        client: nil
      )
    ])
  end

  it "renders a list of orders" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end

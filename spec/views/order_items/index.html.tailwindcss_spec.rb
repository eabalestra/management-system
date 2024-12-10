require 'rails_helper'

RSpec.describe "order_items/index", type: :view do
  before(:each) do
    assign(:order_items, [
      OrderItem.create!(
        quantity: 2,
        price_at_sale: "9.99",
        discount: "9.99",
        product: nil,
        order: nil
      ),
      OrderItem.create!(
        quantity: 2,
        price_at_sale: "9.99",
        discount: "9.99",
        product: nil,
        order: nil
      )
    ])
  end

  it "renders a list of order_items" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end

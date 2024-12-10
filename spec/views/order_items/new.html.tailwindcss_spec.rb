require 'rails_helper'

RSpec.describe "order_items/new", type: :view do
  before(:each) do
    assign(:order_item, OrderItem.new(
      quantity: 1,
      price_at_sale: "9.99",
      discount: "9.99",
      product: nil,
      order: nil
    ))
  end

  it "renders new order_item form" do
    render

    assert_select "form[action=?][method=?]", order_items_path, "post" do

      assert_select "input[name=?]", "order_item[quantity]"

      assert_select "input[name=?]", "order_item[price_at_sale]"

      assert_select "input[name=?]", "order_item[discount]"

      assert_select "input[name=?]", "order_item[product_id]"

      assert_select "input[name=?]", "order_item[order_id]"
    end
  end
end

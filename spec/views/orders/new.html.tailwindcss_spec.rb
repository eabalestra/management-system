require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      total_amount: "9.99",
      payment_status: 1,
      user: nil,
      client: nil
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[total_amount]"

      assert_select "input[name=?]", "order[payment_status]"

      assert_select "input[name=?]", "order[user_id]"

      assert_select "input[name=?]", "order[client_id]"
    end
  end
end

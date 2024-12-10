require 'rails_helper'

RSpec.describe "order_items/show", type: :view do
  before(:each) do
    assign(:order_item, OrderItem.create!(
      quantity: 2,
      price_at_sale: "9.99",
      discount: "9.99",
      product: nil,
      order: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

require 'rails_helper'

RSpec.describe "order_payments/show", type: :view do
  before(:each) do
    assign(:order_payment, OrderPayment.create!(
      amount: "9.99",
      payment_method: 2,
      order: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end

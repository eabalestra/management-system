require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
      code: "Code",
      name: "Name",
      description: "MyText",
      image_url: "Image Url",
      stock_quantity: 2,
      unit_cost: "9.99",
      unit_price: "9.99",
      tax_amount: "9.99",
      profit_margin: "9.99",
      supplier: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end

require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
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
      ),
      Product.create!(
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
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Image Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end

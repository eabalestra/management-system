require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      code: "MyString",
      name: "MyString",
      description: "MyText",
      image_url: "MyString",
      stock_quantity: 1,
      unit_cost: "9.99",
      unit_price: "9.99",
      tax_amount: "9.99",
      profit_margin: "9.99",
      supplier: nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[code]"

      assert_select "input[name=?]", "product[name]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[image_url]"

      assert_select "input[name=?]", "product[stock_quantity]"

      assert_select "input[name=?]", "product[unit_cost]"

      assert_select "input[name=?]", "product[unit_price]"

      assert_select "input[name=?]", "product[tax_amount]"

      assert_select "input[name=?]", "product[profit_margin]"

      assert_select "input[name=?]", "product[supplier_id]"
    end
  end
end

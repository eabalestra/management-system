require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  let(:product) do
    FactoryBot.create(:product)
  end

  before(:each) do
    assign(:product, product)
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', product_path(product), 'post' do
      assert_select 'input[name=?]', 'product[code]'
      assert_select 'input[name=?]', 'product[name]'
      assert_select 'textarea[name=?]', 'product[description]'
      assert_select 'input[name=?]', 'product[image_url]'
      assert_select 'input[name=?]', 'product[stock_quantity]'
      assert_select 'input[name=?]', 'product[unit_cost]'
      assert_select 'input[name=?]', 'product[unit_price]'
      assert_select 'input[name=?]', 'product[tax_amount]'
      assert_select 'input[name=?]', 'product[profit_margin]'
      assert_select 'input[name=?]', 'product[supplier_id]'
      assert_select 'input[name=?]', 'product[last_price_update]'
      assert_select 'input[name=?]', 'product[last_stock_update]'
    end
  end
end

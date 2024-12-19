require 'rails_helper'

RSpec.describe 'products/new', type: :view do
  before(:each) do
    assign(:product, FactoryBot.build(:product))
  end

  it 'renders new product form' do
    render

    assert_select 'form[action=?][method=?]', products_path, 'post' do
      assert_select 'input[name=?]', 'product[code]'

      assert_select 'input[name=?]', 'product[name]'

      assert_select 'textarea[name=?]', 'product[description]'

      assert_select 'input[name=?]', 'product[image_url]'

      assert_select 'input[name=?]', 'product[stock_quantity]'

      assert_select 'input[name=?]', 'product[unit_cost]'

      assert_select 'input[name=?]', 'product[unit_price]'

      assert_select 'input[name=?]', 'product[tax_amount]'

      assert_select 'input[name=?]', 'product[profit_margin]'

      assert_select 'input[name=?]', 'product[last_price_update]'

      assert_select 'input[name=?]', 'product[last_stock_update]'

      assert_select 'input[name=?]', 'product[supplier_id]'
    end
  end
end

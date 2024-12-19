# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [FactoryBot.create(:product), FactoryBot.create(:product)])
    assign(:categories, [FactoryBot.create(:category), FactoryBot.create(:category)])
    @pagy = assign(:pagy, instance_double('Pagy', pages: 1))
  end

  it 'renders a list of products' do
    render
    cell_selector = 'div#products>div'

    assert_select cell_selector, count: 2
  end
end

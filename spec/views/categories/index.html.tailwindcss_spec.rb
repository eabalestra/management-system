# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  before(:each) do
    @categories = assign(:categories, [FactoryBot.create(:category), FactoryBot.create(:category)])
  end

  it 'renders a list of categories' do
    render
    cell_selector = 'div>div'

    assert_select cell_selector, text: Regexp.new(@categories[0].name.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(@categories[1].name.to_s), count: 1
  end
end

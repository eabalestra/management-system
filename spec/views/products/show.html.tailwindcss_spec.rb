require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  include Rails.application.routes.url_helpers

  before(:each) do
    @product = assign(:product, FactoryBot.create(:product))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{Regexp.escape(@product[:name])}/)
  end
end

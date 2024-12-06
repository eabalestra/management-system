require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        name: "Name",
        phone: "Phone",
        dir: "Dir",
        email: "Email",
        city: "City",
        website: "Website"
      ),
      Supplier.create!(
        name: "Name",
        phone: "Phone",
        dir: "Dir",
        email: "Email",
        city: "City",
        website: "Website"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Dir".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Website".to_s), count: 2
  end
end

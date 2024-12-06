require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        name: "Name",
        phone: "Phone",
        dir: "Dir",
        email: "Email",
        city: "City"
      ),
      Client.create!(
        name: "Name",
        phone: "Phone",
        dir: "Dir",
        email: "Email",
        city: "City"
      )
    ])
  end

  it "renders a list of clients" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Dir".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
  end
end

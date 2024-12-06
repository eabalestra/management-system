require 'rails_helper'

RSpec.describe "suppliers/new", type: :view do
  before(:each) do
    assign(:supplier, Supplier.new(
      name: "MyString",
      phone: "MyString",
      dir: "MyString",
      email: "MyString",
      city: "MyString",
      website: "MyString"
    ))
  end

  it "renders new supplier form" do
    render

    assert_select "form[action=?][method=?]", suppliers_path, "post" do

      assert_select "input[name=?]", "supplier[name]"

      assert_select "input[name=?]", "supplier[phone]"

      assert_select "input[name=?]", "supplier[dir]"

      assert_select "input[name=?]", "supplier[email]"

      assert_select "input[name=?]", "supplier[city]"

      assert_select "input[name=?]", "supplier[website]"
    end
  end
end

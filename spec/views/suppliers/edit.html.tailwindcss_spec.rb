require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  let(:supplier) {
    Supplier.create!(
      name: "MyString",
      phone: "MyString",
      dir: "MyString",
      email: "MyString",
      city: "MyString",
      website: "MyString"
    )
  }

  before(:each) do
    assign(:supplier, supplier)
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(supplier), "post" do

      assert_select "input[name=?]", "supplier[name]"

      assert_select "input[name=?]", "supplier[phone]"

      assert_select "input[name=?]", "supplier[dir]"

      assert_select "input[name=?]", "supplier[email]"

      assert_select "input[name=?]", "supplier[city]"

      assert_select "input[name=?]", "supplier[website]"
    end
  end
end

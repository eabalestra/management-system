require 'rails_helper'

RSpec.describe "clients/new", type: :view do
  before(:each) do
    assign(:client, Client.new(
      name: "MyString",
      phone: "MyString",
      dir: "MyString",
      email: "MyString",
      city: "MyString"
    ))
  end

  it "renders new client form" do
    render

    assert_select "form[action=?][method=?]", clients_path, "post" do

      assert_select "input[name=?]", "client[name]"

      assert_select "input[name=?]", "client[phone]"

      assert_select "input[name=?]", "client[dir]"

      assert_select "input[name=?]", "client[email]"

      assert_select "input[name=?]", "client[city]"
    end
  end
end

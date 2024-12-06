require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  let(:client) {
    Client.create!(
      name: "MyString",
      phone: "MyString",
      dir: "MyString",
      email: "MyString",
      city: "MyString"
    )
  }

  before(:each) do
    assign(:client, client)
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(client), "post" do

      assert_select "input[name=?]", "client[name]"

      assert_select "input[name=?]", "client[phone]"

      assert_select "input[name=?]", "client[dir]"

      assert_select "input[name=?]", "client[email]"

      assert_select "input[name=?]", "client[city]"
    end
  end
end

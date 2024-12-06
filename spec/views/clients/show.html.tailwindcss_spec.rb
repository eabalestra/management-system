require 'rails_helper'

RSpec.describe "clients/show", type: :view do
  before(:each) do
    assign(:client, Client.create!(
      name: "Name",
      phone: "Phone",
      dir: "Dir",
      email: "Email",
      city: "City"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Dir/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/City/)
  end
end

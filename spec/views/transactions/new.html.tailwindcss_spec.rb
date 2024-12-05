require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      amount: "9.99",
      transaction_type: 1,
      source_account_id: 1,
      destination_account_id: 1,
      description: "MyString"
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input[name=?]", "transaction[amount]"

      assert_select "input[name=?]", "transaction[transaction_type]"

      assert_select "input[name=?]", "transaction[source_account_id]"

      assert_select "input[name=?]", "transaction[destination_account_id]"

      assert_select "input[name=?]", "transaction[description]"
    end
  end
end

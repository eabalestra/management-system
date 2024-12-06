require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  let(:transaction) {
    Transaction.create!(
      amount: "9.99",
      transaction_type: 1,
      source_account_id: 1,
      destination_account_id: 1,
      description: "MyString"
    )
  }

  before(:each) do
    assign(:transaction, transaction)
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(transaction), "post" do

      assert_select "input[name=?]", "transaction[amount]"

      assert_select "input[name=?]", "transaction[transaction_type]"

      assert_select "input[name=?]", "transaction[source_account_id]"

      assert_select "input[name=?]", "transaction[destination_account_id]"

      assert_select "input[name=?]", "transaction[description]"
    end
  end
end

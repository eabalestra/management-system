require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        amount: "9.99",
        transaction_type: 2,
        source_account_id: 3,
        destination_account_id: 4,
        description: "Description"
      ),
      Transaction.create!(
        amount: "9.99",
        transaction_type: 2,
        source_account_id: 3,
        destination_account_id: 4,
        description: "Description"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end

class AddCreditCardDetailsToBillingDetail < ActiveRecord::Migration
  def change
    add_column :billing_details, :simplify_token, :string
    add_column :billing_details, :simplify_customer_id, :string
    add_column :billing_details, :card_last_four_digits, :integer
    add_column :billing_details, :card_exp_month, :integer
    add_column :billing_details, :card_exp_year, :integer
    add_column :billing_details, :card_type, :string
  end
end

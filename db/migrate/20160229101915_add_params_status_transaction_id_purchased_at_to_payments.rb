class AddParamsStatusTransactionIdPurchasedAtToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :notification_params, :text
    add_column :payments, :status, :string
    add_column :payments, :transaction_id, :string
    add_column :payments, :purchased_at, :datetime
  end
end

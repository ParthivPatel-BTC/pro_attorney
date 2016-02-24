class AddParamsStatusTransactionIdPurchasedAtToCases < ActiveRecord::Migration
  def change
    add_column :cases, :notification_params, :text
    add_column :cases, :transaction_id, :string
    add_column :cases, :purchased_at, :datetime
  end
end

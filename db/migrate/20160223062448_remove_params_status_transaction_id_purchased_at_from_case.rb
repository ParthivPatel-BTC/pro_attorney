class RemoveParamsStatusTransactionIdPurchasedAtFromCase < ActiveRecord::Migration
  def change
    remove_column :cases, :notification_params, :text
    remove_column :cases, :transaction_id, :string
    remove_column :cases, :purchased_at, :datetime
  end
end

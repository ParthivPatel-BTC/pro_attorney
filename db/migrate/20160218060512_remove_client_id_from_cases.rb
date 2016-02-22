class RemoveClientIdFromCases < ActiveRecord::Migration
  def change
    remove_column :cases, :client_id, :integer
  end
end

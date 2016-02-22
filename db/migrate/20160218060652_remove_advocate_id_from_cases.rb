class RemoveAdvocateIdFromCases < ActiveRecord::Migration
  def change
    remove_column :cases, :advocate_id, :integer
  end
end

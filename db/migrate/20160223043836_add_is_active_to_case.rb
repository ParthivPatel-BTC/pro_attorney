class AddIsActiveToCase < ActiveRecord::Migration
  def change
    add_column :cases, :is_active, :boolean,default: true
  end
end

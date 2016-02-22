class AddUserRefToCases < ActiveRecord::Migration
  def change
    add_reference :cases, :user, index: true, foreign_key: true
  end
end

class AddCasetypeidRefToCase < ActiveRecord::Migration
  def change
    add_reference :cases, :case_type, index: true, foreign_key: true
  end
end

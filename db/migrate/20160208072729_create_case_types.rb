class CreateCaseTypes < ActiveRecord::Migration
  def change
    create_table :case_types do |t|
      t.string :case_type
      t.integer :amount

      t.timestamps null: false
    end
  end
end

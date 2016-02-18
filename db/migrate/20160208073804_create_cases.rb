class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :client_id
      t.integer :advocate_id
      t.string :case_title
      t.string :location
      t.string :case_detail
      t.string :case_document
      t.string :status
      
      t.timestamps null: false
    end
  end
end

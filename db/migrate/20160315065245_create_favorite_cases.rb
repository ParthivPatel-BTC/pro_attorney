class CreateFavoriteCases < ActiveRecord::Migration
  def change
    create_table :favorite_cases do |t|
      t.integer :user_id
      t.integer :case_id

      t.timestamps null: false
    end
  end
end

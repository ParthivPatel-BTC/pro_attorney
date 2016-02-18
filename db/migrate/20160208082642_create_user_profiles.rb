class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :mobile_no
      t.text :address
      t.string :city
      t.string :pincode
      t.string :qualification
      t.string :experience

      t.timestamps null: false
    end
  end
end

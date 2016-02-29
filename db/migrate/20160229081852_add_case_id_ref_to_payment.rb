class AddCaseIdRefToPayment < ActiveRecord::Migration
  def change
    add_reference :payments, :case, index: true, foreign_key: true
  end
end

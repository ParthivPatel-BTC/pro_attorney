class AddCaseIdRefToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :case, index: true, foreign_key: true
  end
end

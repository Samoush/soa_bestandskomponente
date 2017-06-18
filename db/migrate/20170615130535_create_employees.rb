class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :forename
      t.string :surname
      t.date :birthday
      t.string :role
      t.string :authentication_key
 
      t.timestamps
    end
  end
end

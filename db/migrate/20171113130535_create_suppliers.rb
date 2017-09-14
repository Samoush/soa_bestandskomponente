class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.date :name
      t.string :address
 
      t.timestamps
    end
  end
end

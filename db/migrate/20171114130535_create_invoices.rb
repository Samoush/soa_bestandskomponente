class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.date :date
      t.string :address
      t.integer :amount
      t.string :products
      t.string :iban
      t.boolean :payed
      t.boolean :escalated
      t.date :escalation_date
      t.string :comment
      t.references :supplier
 
      t.timestamps
    end
  end
end

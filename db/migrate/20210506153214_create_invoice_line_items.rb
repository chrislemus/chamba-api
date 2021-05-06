class CreateInvoiceLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_line_items do |t|
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end

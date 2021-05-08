class CreateInvoiceLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_line_items do |t|
      t.text :description
      t.decimal :price
      t.references :invoice, null: false, foreign_key: true
      t.timestamps
    end
  end
end

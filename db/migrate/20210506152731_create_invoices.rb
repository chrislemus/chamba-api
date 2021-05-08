class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.datetime :paid_date
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

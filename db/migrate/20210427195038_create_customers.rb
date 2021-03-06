class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :avatar
      t.string :email
      t.string :phone_mobile
      t.string :phone_home
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end

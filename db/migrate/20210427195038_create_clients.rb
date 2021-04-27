class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :avatar
      t.string :email
      t.string :mobile_phone
      t.string :home_phone
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end

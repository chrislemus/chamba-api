class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :avatar
      t.string :email
      t.boolean :blocked, default: false
      t.string :password_digest
      t.timestamps
    end
  end
end

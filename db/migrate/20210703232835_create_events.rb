class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.text :notes
      t.references :customer, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.bigint :ieul_store_id, null: false
      t.string :postal_code
      t.string :address, null: false
      t.string :phone_number
      t.string :fax_number
      t.string :business_duration
      t.string :regular_holiday
      t.text :introduction_text, null: false
      t.string :catch_copy, null: false

      t.references :company, foreign_key: true, null: false
      t.references :city, foreign_key: true, null: false
      t.timestamps
    end
  end
end

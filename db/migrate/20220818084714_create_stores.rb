class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.bigint :ieul_store_id
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.string :fax_number
      t.string :business_duration
      t.string :regular_holiday
      t.string :introduction_text
      t.string :catch_copy

      t.references :company, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end

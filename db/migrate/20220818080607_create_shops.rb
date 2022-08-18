class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      # company_id
      # city_id
      t.bigint :ieul_companyid
      t.string :postal_code
      t.string :address
      t.string :phone_number
      t.string :fax_number
      t.string :business_duration
      t.string :regular_holiday
      t.string :introduction_text
      t.string :catch_copy

      t.timestamps
    end
  end
end

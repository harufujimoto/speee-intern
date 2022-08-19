class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.integer :sex, null: false
      t.integer :age, null: false
      t.string :address, null: false
      t.integer :sale_count, null: false
      t.date :sale_consideration_at, null: false
      t.date :evaluation_request_at, null: false
      t.date :launch_at, null: false
      t.date :sale_at, null: false
      t.date :delivery_at, null: false
      t.integer :evaluation_price, null: false
      t.integer :sale_price, null: false
      t.boolean :price_cut, null: false
      t.integer :price_cut_month
      t.integer :price_cut_range
      t.integer :closing_price, null: false
      t.integer :contract_type, null: false
      t.string :headline, null: false
      t.integer :sale_reason, null: false
      t.text :worried, null: false
      t.text :decision_reason, null: false
      t.integer :satisfaction, null: false
      t.text :satisfaction_reason, null: false
      t.text :advice, null: false
      t.text :improvement_point, null: false

      t.references :store, foreign_key: true, null: false
      t.references :city, foreign_key: true, null: false
      t.references :property_type, foreign_key: true, null: false
      t.timestamps
    end
  end
end

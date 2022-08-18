class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :sex
      t.integer :age
      t.string :address
      t.integer :sale_count
      t.date :sale_consideration_at
      t.date :evaluation_request_at
      t.date :launch_at
      t.date :sale_at
      t.date :delivery_at
      t.integer :evaluation_price
      t.integer :sale_price
      t.boolean :price_cut
      t.integer :price_cut_month
      t.integer :price_cut_range
      t.integer :closing_price
      t.integer :contract_type
      t.string :headline
      t.string :sale_reason
      t.text :worried
      t.text :decision_reason
      t.integer :satisfaction
      t.text :satisfaction_reason
      t.text :advice
      t.text :improvement_point

      t.references :property_type, foreign_key: true
      t.timestamps
    end
  end
end

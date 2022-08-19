class CreateValuationAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :valuation_areas do |t|
      t.references :city, foreign_key: true, null: false
      t.references :store, foreign_key: true, null: false
      t.timestamps
    end
  end
end

class CreateValuationAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :valuation_areas do |t|
      t.timestamps

      t.references :city, foreign_key: true
      t.references :store, foreign_key: true
    end
  end
end

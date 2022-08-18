class CreateValuationAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :valuation_areas do |t|
      # store_id
      # city_id
      t.timestamps
    end
  end
end

class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.timestamps

      t.references :prefecture, foreign_key: true
    end
  end
end

class CreatePropertyTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :property_types do |t|
      t.string :property_type_name

      t.timestamps
    end
  end
end

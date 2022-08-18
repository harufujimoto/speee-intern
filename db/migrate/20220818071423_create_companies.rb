class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.bigint :ieul_company_id
      t.text :logo_url
      t.timestamps
    end
  end
end

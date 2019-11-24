class CreateRateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :rate_infos do |t|
      t.references :offer_term_product, foreign_key: true
      t.string :rate_code
      t.string :description
      t.string :begin_range
      t.string :end_range
      t.references :service_unit, foreign_key: true
      t.references :currency, foreign_key: true
      t.float :price_per_unit

      t.timestamps
    end
  end
end

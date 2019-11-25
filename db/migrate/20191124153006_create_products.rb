class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku, limit: 20
      t.references :product_family

      t.timestamps
    end
  end
end

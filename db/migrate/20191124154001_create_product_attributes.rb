class CreateProductAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attributes do |t|
      t.references :product, foreign_key: true
      t.string :attr_name, limit: 20
      t.string :attr_val

      t.timestamps
    end
  end
end

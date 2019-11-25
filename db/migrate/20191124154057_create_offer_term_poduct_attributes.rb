class CreateOfferTermPoductAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :offer_term_poduct_attributes do |t|
      t.references :offer_term_product
      t.string :attr_name, limit: 20
      t.string :attr_val

      t.timestamps
    end
  end
end

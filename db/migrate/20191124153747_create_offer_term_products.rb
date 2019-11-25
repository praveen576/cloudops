class CreateOfferTermProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :offer_term_products do |t|
      t.references :offer_term
      t.references :product
      t.datetime :effective_from

      t.timestamps
    end
  end
end

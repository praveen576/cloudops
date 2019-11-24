class CreateOfferTermProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :offer_term_products do |t|
      t.references :offer_term, foreign_key: true
      t.references :product, foreign_key: true
      t.datetime :effective_from

      t.timestamps
    end
  end
end

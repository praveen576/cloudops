class CreateOfferTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :offer_terms do |t|
      t.references :offer, foreign_key: true
      t.references :term, foreign_key: true

      t.timestamps
    end
  end
end

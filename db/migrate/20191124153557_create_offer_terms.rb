class CreateOfferTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :offer_terms do |t|
      t.references :offer
      t.references :term

      t.timestamps
    end
  end
end

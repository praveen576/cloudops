class AddOfferTermCodeToOfferTerms < ActiveRecord::Migration[5.1]
  def change
    add_column :offer_terms, :offer_term_code, :string, limit: 20
  end
end

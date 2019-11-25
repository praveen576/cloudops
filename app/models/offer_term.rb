class OfferTerm < ApplicationRecord
  belongs_to :offer, optional: true
  belongs_to :term, optional: true

  has_many :offer_term_products
end

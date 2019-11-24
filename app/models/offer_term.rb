class OfferTerm < ApplicationRecord
  belongs_to :offer
  belongs_to :term

  has_many :offer_term_products
end

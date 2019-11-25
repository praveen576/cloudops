class OfferTermProduct < ApplicationRecord
  belongs_to :offer_term
  belongs_to :product

  has_many :rate_infos
end

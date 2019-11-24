class Offer < ApplicationRecord
  has_many :offer_terms
  has_many :offers, through: :offer_terms
end

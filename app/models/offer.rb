class Offer < ApplicationRecord
  has_many :offer_terms
  has_many :terms, through: :offer_terms
end

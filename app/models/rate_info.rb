class RateInfo < ApplicationRecord
  belongs_to :offer_term_product
  belongs_to :service_unit
  belongs_to :currency
end

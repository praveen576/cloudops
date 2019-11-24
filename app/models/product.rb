class Product < ApplicationRecord
  belongs_to :product_family

  has_many :product_attributes

  has_many :offer_term_products
end

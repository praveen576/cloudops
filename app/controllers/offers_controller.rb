class OffersController < ApplicationController

  before_action :load_region_products

  def filter
    @offer_term_products = OfferTermProduct.where(product_id: @product_ids)

    if params[:date].present?
      @offer_term_products = offer_term_products.where(effective_from: Date.parse("2019-11-01"))
    end

    @effective_from = @offer_term_products.first.effective_from

    respond_to do |format|
      format.json { render template: 'offers/filter', status: 200 }
    end
  end

  private

  def load_region_products
    @product_ids = Product.where(service_code: params[:service]).pluck(:id) & ProductAttribute.where(attr_name: 'location', attr_val: params[:region]).pluck(:product_id)
  end

end

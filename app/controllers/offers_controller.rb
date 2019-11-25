class OffersController < ApplicationController

  before_action :validate_params, only: [:filter]
  before_action :load_region_products, only: [:filter]

  def filter
    @offer_term_products = OfferTermProduct.where(product_id: @product_ids)

    if params[:date].present?
      @offer_term_products = @offer_term_products.where(effective_from: Date.parse(params[:date]))
    end

    @effective_from = @offer_term_products.first.try(:effective_from)

    respond_to do |format|
      format.json { render template: 'offers/filter', status: 200 }
    end
  end

  private

  def load_region_products
    @product_ids = Product.where(service_code: params[:service]).pluck(:id) & ProductAttribute.where(attr_name: 'location', attr_val: params[:region]).pluck(:product_id)
  end

  def validate_params
    if params[:date].present? && !(::CommonUtils::DateUtils.valid?(params[:date]))

      render json: { message: "bad date. Please enter a valid date like yyyy-mm-dd" }, status: 400 and return
    end
  end

end

json.array! @offer_term_products.includes(:rate_infos) do |offer_term_product|
  offer_term_product.rate_infos.includes(:service_unit, :currency).each do |rate_info|
    json.description rate_info.description
    json.beginRange rate_info.begin_range
    json.endRange rate_info.end_range
    json.unit rate_info.service_unit.name
    json.pricePerUnit rate_info.price_per_unit
    json.effectiveDate @effective_from.to_s
  end
end
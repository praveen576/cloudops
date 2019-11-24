namespace :cloud_op do
  task :fetch_offers => :environment do

    url = URI.parse("https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json")

    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = 5
    http.open_timeout = 5

    begin
      resp = http.start() {|http|
        http.get(url.path)
      }
      if resp.code == "200"
        data = JSON.parse(resp.body)
        save_price_info(data)
      else
        # can push metrices to influxdb here.
        puts "api response is not success"
      end
    rescue => e
      # can push metrices to influxdb here.
      puts "could not fetch price info:: #{e.message}"
    end
  end

end

def save_price_info(data)
  data = ActiveSupport::HashWithIndifferentAccess.new data

  offer_version = data[:version]
  offer_attributes = { offer_code: data[:offerCode], published_at: data[:publicationDate] }

  Offer.find_or_create_by(version: offer_version, offer_attributes)

  data[:products].each do |sku, info|
    next if Product.exists?(sku: sku)
    product = Product.new(sku: sku)
    prod_family = info[:productFamily]
    if prod_family.present?
      product.product_family = ProductFamily.find_or_create_by(name: prod_family)
    end

    if product.save
      prod_attrs = []
      info[:attributes].each do |attr_name, attr_value|
        prod_attrs << { attr_name: attr_name, attr_value: attr_value }
      end
      product.create_product_attributes(prod_attrs)
    end
  end

  data[:terms].each do |offer_term_name, offer_term_products|
    term = Term.find_or_create_by(name: offer_term_name)    
    offer.terms << term
    offer_term = OfferTerm.where(term_id: term.id, offer_id: offer.id).first

    offer_term_products.each do |sku, prod_offer_term_info|
      next if (prod = Product.find_by_sku(sku)).blank?

      prod_offer_term_info.each do |offer_term_prod_code, price_infos|
        offer_term_code = price_infos[:offerTermCode]
        offer_term.update_attributes(offer_term_code: offer_term_code)

        offer_term_prod = OfferTermProduct.new(effective_from: price_infos[:effectiveDate])
        offer_term_prod.product = prod
        offer_term_prod.offer_term = offer_term
        offer_term_prod.save

        rate_info_objects = []
        price_infos[:priceDimensions].values.each do |price_val|
          obj = {
                  description: price_val[:description],
                  rate_code: price_val[:rateCode],
                  begin_range: price_val[:beginRange],
                  end_range: price_val[:endRange],
                }
          service_unit = price_val[:unit]
          su = ServiceUnit.find_or_create_by(name: service_unit)
          obj[:service_unit_id] = su.id

          ppu = price_val[:pricePerUnit]
          currency = Currency.find_or_create_by(name: ppu.keys.first)

          obj[:currency_id] = currency.id
          obj[:price_per_unit] = ppu.values.first
          
          rate_info_objects << obj
        end
        RateInfo.create(rate_info_objects)
      end
    end

  end

end

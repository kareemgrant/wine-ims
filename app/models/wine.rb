class Wine < ActiveRecord::Base

  def retail_price_in_dollars
    retail_price.to_d / 100 if retail_price.present?
  end

  def retail_price_in_dollars=(dollars)
    self.retail_price = (dollars.to_d * 100) if dollars.present?
  end
end

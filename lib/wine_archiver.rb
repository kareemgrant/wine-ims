class WineArchiver

  def self.store(results)
    results['Products']['List'].each do |wine|

      api_id = wine['Id'].to_s

      unless wine_api_ids.include?(api_id)
        Wine.create(
          name: wine['Name'],
          api_id: api_id,
          wine_type: wine['Type'],
          retail_price: convert_to_cents(wine['PriceRetail']),
          url: wine['Url']
        )
      end
    end
  end

  private

  def self.convert_to_cents(dollars)
    (dollars.to_d * 100) if dollars.present?
  end

  def self.wine_api_ids
    @api_ids ||= Wine.pluck(:api_id).compact
  end
end

class WineApi
  include HTTParty
  base_uri APP_CONFIG['wine_api_base_url']

  attr_reader :count, :offset

  def initialize(count, offset)
    @count = count
    @offset = offset
  end

  def fetch_wines
    options = {
      apikey: APP_CONFIG['wine_api_key'],
      size: count,
      offset: offset
    }

    self.class.get("/api/beta2/service.svc/json/catalog", query: options)
  end
end


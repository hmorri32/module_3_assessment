class BestBuyService
  def initialize(zip_code=80202)
    @zip_code = zip_code
    @client   = configure_faraday
  end

  def configure_faraday
    Faraday.new("https://api.bestbuy.com/v1/") do |f|
      f.adapter Faraday.default_adapter
      f.params[:apiKey] = ENV['YUNG_BB_KEY']
    end
  end

  def stores_within_25_miles
    get_json("stores(area(#{@zip_code},25))", filter)[:stores]
  end

  private
    attr_reader :client, :zip_code

    def get_json(url, params)
      response = client.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def filter
      {
        format: 'json',
        show: 'longName, city, distance, storeType, phone',
        pageSize: 100,
      }
    end
end
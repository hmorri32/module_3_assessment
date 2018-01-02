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
    get_json("stores(area(80202,25))?format=json&pageSize=100&show=longName,city,distance,storeType,phone")[:stores]
  end

  private
  attr_reader :client, :zip_code

  def get_json(url)
    response = client.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end


# curl "https://api.bestbuy.com/v1/stores(area(55423))?format=json&show=storeType,longName,city,distance,phone&apiKey=YourAPIKey"
# curl "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&distance=25&show=phone,storeType,longName,city,distance&apiKey=qy8vdpfcgsxtfw657mnbu7nc"

# curl "https://api.bestbuy.com/v1/stores(area(55423,25))?format=json&show=longName,city,distance,storeType&apiKey=YourAPIKey"

# curl "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=longName,city,distance,storeType,phone&apiKey=qy8vdpfcgsxtfw657mnbu7nc"
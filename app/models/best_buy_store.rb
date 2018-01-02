class BestBuyStore
  attr_reader :long_name, :city, :distance, :store_type, :phone

  def initialize(data)
    @long_name  = data[:longName]
    @city       = data[:city]
    @distance   = data[:distance]
    @store_type = data[:storeType]
    @phone      = data[:phone]
  end
end
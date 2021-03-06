class SearchController < ApplicationController
  def index
    @bb     = BestBuyService.new(params[:zip_code])
    @total  = @bb.stores_within_25_miles.map { |store_data| BestBuyStore.new(store_data) }
    @stores = @total.paginate(:page => params[:page], :per_page => 10)
  end
end
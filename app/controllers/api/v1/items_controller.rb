class Api::V1::ItemsController < Api::V1::BaseController
  def index
    json_response Item.all
  end
end
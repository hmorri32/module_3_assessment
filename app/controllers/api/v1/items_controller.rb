class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show, :destroy]

  def index
    json_response Item.all
  end

  def show
    json_response @item
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
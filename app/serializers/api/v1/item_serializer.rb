class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url
end

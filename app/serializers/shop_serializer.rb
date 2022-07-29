class ShopSerializer
  include JSONAPI::Serializer
  attributes :name, :metas
  belongs_to :user
end

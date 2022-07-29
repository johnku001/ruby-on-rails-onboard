class Shop
  include Mongoid::Document
  field :name, type: String
  field :metas, type: Hash
  belongs_to :user
end

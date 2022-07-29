class User
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  # field :bio, type: String

  field :age, type: Integer
  validates :age, numericality: { greater_than_or_equal_to: 0 }

  field :region, type: String
  validates :region,  inclusion: { in: ["hong_kong", "taiwan", "china"] }

  has_many :shop
 
end

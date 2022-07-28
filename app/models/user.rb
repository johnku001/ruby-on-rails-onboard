class User
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  # field :bio, type: String

  field :age, type: Integer
  validates :age, numericality: { greater_than_or_equal_to: 0 }

  field :region, type: String
  validates :region,  inclusion: { in: ["hong_kong", "taiwan", "china"] }

  # field :gender, type: String
  # validates :gender, inclusion: { in: ["Male", "Female", "Others"] }

  # field :address, type: Hash

  # has_one :shop
end

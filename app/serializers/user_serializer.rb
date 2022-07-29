class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :age, :region
  attribute :full_name do |user, params|
    "#{user.last_name} #{user.first_name} "
  end
end

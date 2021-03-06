class User < BaseModel
  include Ohm::Timestamps

  attribute :name

  # email
  attribute :email
  
  # Unique identifier for this user, in the form "{provider}|{provider-id}"
  attribute :uid
  index     :uid
  unique    :uid

  # Session token
  attribute :token
  index     :token

  # Submitted movies
  collection :movies, :Movie
end

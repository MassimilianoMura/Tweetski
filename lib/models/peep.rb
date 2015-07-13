class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String

  has n, :tags, through: Resource
end
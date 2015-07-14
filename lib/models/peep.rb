class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :post_time, String

  has n, :tags, through: Resource
  belongs_to :user

  def time=(time)
    self.post_time = "#{time.hour}:#{time.min} #{time.day}/#{time.month}/#{time.year}"
  end
end
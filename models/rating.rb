class Rating
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :value, Integer
  property :created_at, DateTime
  property :comment, String
  belongs_to :event

  def self.for_event(event)
  	rating = Rating.new
  	rating.event = event
  	rating 
  end

end

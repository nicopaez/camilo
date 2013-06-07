class Event
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :date, DateTime, :required => true
  property :slug, String
  has n, :ratings
  before :save, :set_slug

  validates_with_method :check_date

  def check_date
    return (self.date >= Date.today) if self.date.is_a?(Date)
    return false
  end

  def positive_ratings_count
    self.ratings.all(:value => 1).size
  end

  def negative_ratings_count
    self.ratings.all(:value => -1).size
  end

  def neutral_ratings_count
    self.ratings.all(:value => 0).size
  end

  def set_slug
    self.slug = Event.generate_slug(self.name) if self.new?
  end

  def self.generate_slug(name, initial_count = 1)
    puts "initial count #{count}"
    candidate_slug = name.gsub(' ', '')
    candidate_slug = "#{candidate_slug}#{initial_count}".downcase
    count = Event.all(:slug => candidate_slug).size
    puts "found count #{count}"
    if count == 0
      return candidate_slug 
    else
      return generate_slug(name, initial_count + 1)
    end
  end

end

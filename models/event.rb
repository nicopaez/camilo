class Event
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :date, DateTime, :required => true
  property :slug, String
  property :short_url, String
  belongs_to :account
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
    self.slug = Event.generate_slug(@name) if self.new?
    #self.short_url = UrlShortener.for_default_url.shorten("events/rate/#{@event.slug}").short_url
  end
  
  def slug
    set_slug if @slug.nil?
    @slug
  end

  def self.generate_slug(name, initial_count = 1)
    candidate_slug = name.gsub(' ', '')
    candidate_slug = "#{candidate_slug}#{initial_count}".downcase
    count = Event.all(:slug => candidate_slug).size
    if count == 0
      return candidate_slug 
    else
      return generate_slug(name, initial_count + 1)
    end
  end

end

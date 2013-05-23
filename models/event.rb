class Event
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :date, DateTime, :required => true
  property :slug, String

  before :save, :set_slug

  validates_with_method :check_date

  def check_date
    return (self.date >= Date.today) if self.date.is_a?(Date)
    return false
  end

  def set_slug
    self.slug = Event.generate_slug(self.name) if self.new?
  end

  def self.generate_slug(name, count = 1)
    candidate_slug = name.gsub(' ', '')
    candidate_slug = "#{candidate_slug}#{count}".downcase
    count = Event.all(:slug => candidate_slug).count
    return candidate_slug if count == 0
    return generate_slug(name, count + 1)
  end

end

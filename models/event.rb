class Event
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :date, DateTime
  property :slug, String

  def self.create(name, date)
    raise InvalidDate if date < Date.today
    event = Event.new
    event.name = name
    event.date = date
    event.slug = generate_slug(event.name)
    event
  end

  def self.generate_slug(name, count = 1)
    candidate_slug = name.gsub(' ', '')
    candidate_slug = "#{candidate_slug}#{count}"
    count = Event.all(:slug => candidate_slug).count
    return candidate_slug if count == 0
    return generate_slug(name, count + 1)
  end

end

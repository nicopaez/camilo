# Helper methods defined here can be accessed in any controller or view in the application

Camilo::App.helpers do
  # def simple_helper_method
  #  ...
  # end

  def render_date(date)
    return date.to_date if date.is_a?(Date)
    return ''
  end

  def host_url
  	ENV['HOST_URL']
  end
  
  def generate_event_link(event_slug)
    "#{server_url}events/rate/#{event_slug}"
  end
  
end

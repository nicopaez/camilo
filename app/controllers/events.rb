Camilo::App.controllers :events do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  get '/' do
   @message = 'Under construction. Come back in a while'
   render 'events/index' 
  end

  get '/new' do
    render 'events/new'
  end

  post '/new', :csrf_protection => false do
    event = Event.new(params)

  end

  get '/:event_id/view' do
    @event = Event.find(params[:event_id])
    render 'events/view'
  end

end

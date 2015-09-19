Camilo::App.controllers :events do

  get :index do
    @events = Event.all(:account => current_account)
    render 'events/index'
  end

  get :new do
    @event = Event.new
    render 'events/new'
  end

  get '/my' do
    @events = Event.all(:account => current_account)
    render 'events/index'
  end

  get :show do
    @event = Event.get(params[:id].to_i)
    render 'events/show'
  end

  post :create do
    @event = Event.new(params[:event])
    @event.account = current_account
    if @event.save
      redirect(url(:events, :show, :id => @event.id))
    else
      flash.now[:error] = "Error: ambos campos son requeridos"
      render 'events/new'
    end
  end

  get '/:event_slug/edit' do
    @event = Event.find_by_slug(params[:event_slug])
    if(@event.nil?)
      @message = "El evento buscado no existe."
      render 'events/message'
    else
      render 'events/edit'
    end
  end

  get '/rate/:event_slug' do
    @event = Event.find_by_slug(params[:event_slug])
    if(@event.nil?)
      @message = "El evento buscado no existe."
      render 'events/message'
    else
      render 'events/rate'
    end
  end

  post '/rate/:event_id' do
    @event = Event.find_by_slug(params[:event_id])
    rating = Rating.for_event(@event)
    rating.value = params[:value]
    rating.comment = params[:comment] 
    rating.save
    @message = "Gracias por su evaluacion"
    render 'events/message'
  end

  get '/:event_slug/ratings' do
    @event = Event.find_by_slug(params[:event_slug])   
    if(@event.account == current_account) 
      render 'events/ratings'
    else
      return 403
    end
  end

  get '/:event_slug/comments' do
    @event = Event.find_by_slug(params[:event_slug])   
    if(@event.account == current_account) 
      render 'events/comments'
    else
      return 403
    end
  end

  post '/:event_id/update' do
    @event = Event.get(params[:event_id].to_i)
    if @event && (@event.account == current_account)
      if @event.update(params[:event])
        flash[:success] = t(:update_success, :model => 'Event', :id =>  "#{params[:id]}")
        redirect(url(:events, :show, :id => @event.id))
      else
        flash.now[:error] = "Error: ambos campos son requeridos y la fecha debe ser posterior a hoy"
        render 'events/edit'
      end
    else
      flash[:warning] = t(:update_warning, :model => 'event', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Events"
    event = Event.get(params[:id].to_i)
    if event
      if event.destroy
        flash[:success] = t(:delete_success, :model => 'Event', :id => "#{params[:id]}")
      else
        flash[:error] = t(:delete_error, :model => 'event')
      end
      redirect url(:events, :index)
    else
      flash[:warning] = t(:delete_warning, :model => 'event', :id => "#{params[:id]}")
      halt 404
    end
  end

end

Camilo::App.controllers :events do

  get :index do
    @title = "Events"
    @events = Event.all
    render 'events/index'
  end

  get :new do
    @event = Event.new
    render 'events/new'
  end

  get :show do
    @event = Event.get(params[:id].to_i)
    render 'events/show'
  end

  post :create do
    @event = Event.new(params[:event])
    if @event.save
      redirect(url(:events, :show, :id => @event.id))
    else
      flash.now[:error] = "Error: ambos campos son requeridos"
      render 'events/new'
    end
  end

  get '/rate/:event_id' do
    @event = Event.find_by_slug(params[:event_id])
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

  get :edit, :with => :id do
    @title = t(:edit_title, :model => "event #{params[:id]}")
    @event = Event.get(params[:id].to_i)
    if @event
      render 'events/edit'
    else
      flash[:warning] = t(:create_error, :model => 'event', :id => "#{params[:id]}")
      halt 404
    end
  end

  get '/:event_slug/ratings' do
    @event = Event.find_by_slug(params[:event_slug])    
    render 'events/ratings'
  end

  put :update, :with => :id do
    @title = t(:update_title, :model => "event #{params[:id]}")
    @event = Event.get(params[:id].to_i)
    if @event
      if @event.update(params[:event])
        flash[:success] = t(:update_success, :model => 'Event', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:events, :index)) :
          redirect(url(:events, :edit, :id => @event.id))
      else
        flash.now[:error] = t(:update_error, :model => 'event')
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

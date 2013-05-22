Camilo::App.controllers :events do

  get :index do
    @title = "Events"
    @events = Event.all
    render 'events/index'
  end

  get :new do
    @title = 'Nuevo evento'
    @event = Event.new
    render 'events/new'
  end

  get :show do
    @event = Event.get(params[:id].to_i)
    render 'events/show'
  end

  post :create do
    @event = Event.new(params[:event])
    @event.set_slug
    if @event.save
      redirect(url(:events, :show, :id => @event.id))
    else
      flash.now[:error] = "Ambos campos son requeridos"
      render 'events/new'
    end
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

  delete :destroy_many do
    @title = "Events"
    unless params[:event_ids]
      flash[:error] = t(:destroy_many_error, :model => 'event')
      redirect(url(:events, :index))
    end
    ids = params[:event_ids].split(',').map(&:strip).map(&:to_i)
    events = Event.all(:id => ids)
    
    if events.destroy
    
      flash[:success] = t(:destroy_many_success, :model => 'Events', :ids => "#{ids.to_sentence}")
    end
    redirect url(:events, :index)
  end
end

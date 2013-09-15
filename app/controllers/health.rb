Camilo::App.controllers :health do

  get :index do
  	Event.count
    content_type:'json'
    { version: Version.current }.to_json
  end


end

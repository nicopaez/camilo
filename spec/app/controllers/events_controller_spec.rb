require 'spec_helper'

describe 'EventsController' do

  it 'get / should render index' do
    Camilo::App.any_instance.should_receive(:render).with('home/index').and_return({})
    get '/'
    last_response.should be_ok
  end

end

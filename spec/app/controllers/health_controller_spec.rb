require 'spec_helper'

describe 'HealthController' do

  it 'index should return json with version' do
    Event.should_receive(:count).and_return(1)
    get '/health'
    last_response.should be_ok
    last_response.content_type.should eq 'application/json'
    last_response.body.include?('version').should be true
  end

end

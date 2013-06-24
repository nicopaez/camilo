require 'spec_helper'

describe UrlShortener do

  describe 'shorten' do

    it 'should delegate to Googl' do
      short_url = 'http://goo.gl/xyz'
      Googl.should_receive(:shorten).with('http://localhost/some_place').and_return('http://goo.gl/xyz')
      shortener = UrlShortener.for_base_url 'http://localhost'
      url = shortner.shorten '/some_place'
      url.should eq shor_url
    end

  end
end

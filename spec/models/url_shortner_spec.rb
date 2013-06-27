require 'spec_helper'

describe UrlShortener do

  describe 'shorten' do

    it 'should delegate to Googl' do
      short_url = 'http://goo.gl/xyz'
      Googl.should_receive(:shorten).with('http://localhost/some_place').and_return('http://goo.gl/xyz')
      shortener = UrlShortener.for_base_url 'http://localhost'
      url = shortener.shorten '/some_place'
      url.should eq short_url
    end

    it 'should add slash if missing' do
      short_url = 'http://goo.gl/xyz'
      Googl.should_receive(:shorten).with('http://localhost/some_place').and_return('http://goo.gl/xyz')
      shortener = UrlShortener.for_base_url 'http://localhost'
      url = shortener.shorten 'some_place'
      url.should eq short_url
    end

  end

  describe 'for_default_url' do

    it 'should take url from ENV' do
    	ENV['HOST_URL'] = 'http://localhost'
      shortener = UrlShortener.for_default_url
      shortener.base_url.should eq 'http://localhost'
    end

  end

end

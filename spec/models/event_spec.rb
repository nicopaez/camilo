require 'spec_helper'
require 'date'

describe Event do

  describe 'set_slug' do

    it 'should assign downcase slug' do
      Event.should_receive(:all).with(:slug => 'myevent1').and_return([])
      event1 = Event.new
      event1.name ='my Event'
      event1.date = Date.today
      event1.set_slug
      event1.slug.should eq 'myevent1'
    end

    it 'should assign unique slug' do
      Event.should_receive(:all).with(:slug => 'myevent1').and_return([mock()])
      Event.should_receive(:all).with(:slug => 'myevent2').and_return([])
      event1 = Event.new
      event1.name ='my event'
      event1.date = Date.today
      event1.set_slug
      event1.slug.should_not eq 'myevent1'
    end

  end

  describe 'check_date' do

    it 'should return false if date is before today' do
      event1 = Event.new
      event1.name ='my event'
      event1.date = Date.today-1
      event1.check_date.should be false
    end

    it 'should return true if date is today' do
      event1 = Event.new
      event1.name ='my event'
      event1.date = Date.today
      event1.check_date.should be true
    end


    it 'should return true if date is after today' do
      event1 = Event.new
      event1.name ='my event'
      event1.date = Date.today+1
      event1.check_date.should be true
    end

    it 'should return false if date is not valid' do
      event1 = Event.new
      event1.name ='my event'
      event1.date = 'text'
      event1.check_date.should be false
    end

  end
end

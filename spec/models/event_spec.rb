require 'spec_helper'
require 'date'

describe Event do

  describe 'create' do

    it 'should receive name and date' do
      Event.should_receive(:all).and_return([])
      event =  Event.create('event 1', Date.today)
      event.name.should eq 'event 1'
      event.date.should eq Date.today
    end

    it 'should assign slug' do
      Event.should_receive(:all).and_return([])
      event =  Event.create('my event', Date.today)
      event.slug.should eq 'myevent1'
    end

    it 'should assign unique slug' do
      Event.should_receive(:all).with(:slug => 'myevent1').and_return([mock()])
      Event.should_receive(:all).with(:slug => 'myevent2').and_return([])
      event1 = Event.create('my event', Date.today)
      event1.slug.should_not eq 'myevent1'
    end

    it 'should raise InvalidDateException if date before today' do
      expect { Event.create('my event', Date.today-1) }.to raise_error InvalidDate
    end

  end
end

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
      Event.should_receive(:all).with(:slug => 'myevent1').and_return([double()])
      Event.should_receive(:all).with(:slug => 'myevent2').and_return([])
      event1 = Event.new
      event1.name ='my event'
      event1.date = Date.today
      event1.set_slug
      event1.slug.should eq 'myevent2'
    end

  end

  describe 'positive_ratings_count' do

    it 'should return 0 when there are no ratings' do
      event = Event.new
      event.positive_ratings_count.should eq 0
    end

    it 'should return 0 when there are no positive ratings' do
      event = Event.new
      rating = Rating.for_event(event)
      rating.value = -1
      event.ratings.push(rating)
      event.positive_ratings_count.should eq 0
    end

    it 'should return 2 when there 2 positive ratings and 1 negative' do
      event = Event.new
      rating = Rating.for_event(event)
      rating.value = -1
      event.ratings.push(rating)

      rating = Rating.for_event(event)
      rating.value = 1
      event.ratings.push(rating)


      rating = Rating.for_event(event)
      rating.value = 1
      event.ratings.push(rating)

      event.positive_ratings_count.should eq 2
      event.negative_ratings_count.should eq 1
      event.neutral_ratings_count.should eq 0
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

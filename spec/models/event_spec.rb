require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'title presence' do
    it 'if title present' do
      e = Event.new
      e.title = 'pass'
      e.valid?
      expect(e.errors[:title]).not_to include("can't be blank")
    end
    it 'if title not present' do
      e = Event.new
      e.title = ''
      e.valid?
      expect(e.errors[:title]).to include("can't be blank")
    end
  end
  describe 'description presence' do
    it 'if description present' do
      e = Event.new
      e.description = 'pass'
      e.valid?
      expect(e.errors[:description]).not_to include("can't be blank")
    end
    it 'if description not present' do
      e = Event.new
      e.description = ''
      e.valid?
      expect(e.errors[:description]).to include("can't be blank")
    end
  end
  describe 'date presence' do
    it 'if date present' do
      e = Event.new
      e.date = DateTime.now
      e.valid?
      expect(e.errors[:date]).not_to include("can't be blank")
    end
    it 'if date not present' do
      e = Event.new
      e.date = ''
      e.valid?
      expect(e.errors[:date]).to include("can't be blank")
    end
  end
  describe 'location presence' do
    it 'if location present' do
      e = Event.new
      e.location = 'pass'
      e.valid?
      expect(e.errors[:location]).not_to include("can't be blank")
    end
    it 'if location not present' do
      e = Event.new
      e.location = ''
      e.valid?
      expect(e.errors[:location]).to include("can't be blank")
    end
  end
end

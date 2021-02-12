require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'username presence' do
    it 'if username not present' do
      u = User.new
      u.username = ''
      u.valid?
      expect(u.errors[:username]).to include("can't be blank")
    end

    it 'if username present' do
      u = User.new
      u.username = 'user'
      u.valid?
      expect(u.errors[:username]).to_not include("can't be blank")
    end
  end

  describe 'password presence' do
    it 'if password not present' do
      u = User.new
      u.password = ''
      u.valid?
      expect(u.errors[:password]).to include("can't be blank")
    end

    it 'if password present' do
      u = User.new
      u.password = 'pass'
      u.valid?
      expect(u.errors[:password]).to_not include("can't be blank")
    end
  end

  describe 'name presence' do
    it 'if name not present' do
      u = User.new
      u.name = ''
      u.valid?
      expect(u.errors[:name]).to include("can't be blank")
    end

    it 'if name present' do
      u = User.new
      u.name = 'nameuser'
      u.valid?
      expect(u.errors[:name]).to_not include("can't be blank")
    end
  end

  describe 'username email and password presence' do
    it 'if all are present' do
      expect(User.create!(name: 'hey', username: 'user1', password: 'pasaas', email: 'has@has.com').valid?).to be true
    end
  end
end

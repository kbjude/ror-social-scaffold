require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Friendship' do
    it 'Friendhip not created when there is no second user' do
      user = User.create(name: 'Jude', email: 'kk@gmail.com', password: 'Heaven')
      expect(user.friend?('user2')).to eql(false)
    end

    it 'Friendhip created when there is second user' do
      user = User.create(name: 'Jude', email: 'kk@gmail.com', password: 'Heaven')
      user2 = User.create(name: 'Kajura', email: 'kbb@gmail.com', password: 'Heaven')
      user.friendships.create(user_id: user.id, friend_id: user2.id, confirmed: true)
      expect(user.friends.last).to eql(user2)
    end
  end
end

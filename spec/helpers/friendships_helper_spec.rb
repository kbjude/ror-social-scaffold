require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'Friend' do
    it 'has to be for a user' do
      friendship = Friendship.reflect_on_association(:user)
      expect(friendship.macro).to eq(:belongs_to)
    end
  end

  context 'Mutual friend' do
    let(:user1) {User.create(name: 'Lillian', email: 'lil@gmail.com', password: 'blessing')}
    let(:user2) {User.create(name: 'Esie', email: 'esther@gmail.com', password: 'blessing')}
    let(:user3) {User.create(name: 'Jude', email: 'jude@gmail.com', password: 'ChristLord')}

    it 'is when two friends a common friend' do
      user1.friendships.create(user_id: user1.id, friend_id: user2.id, confirmed: true)
      user2.friendships.create(user_id: user2.id, friend_id: user3.id, confirmed: true)
      user1.friendships.create(user_id: user3.id, friend_id: user3.id, confirmed: true)
      expect(user1.friendships.first.mutual).to eql([user3])
    end
  end
end

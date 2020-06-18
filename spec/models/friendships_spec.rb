RSpec.describe 'Friendship', type: :model do
  describe 'Friendship creation' do
    it ' Returns the last added friend' do
      user = User.create(name: 'Jude', email: 'kk7@gmail.com', password: 'Heaven')
      user2 = User.create(name: 'Jude', email: 'kk7@gmail.com', password: 'Heaven')
      f = user.friendships.create(user_id: user.id, friend_id: user2.id, confirmed: true)
      expect(user.friendships.last).to eql(f)
    end
  end
end

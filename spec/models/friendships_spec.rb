RSpec.describe 'Friendship', type: :model do
    describe 'Friendship creation' do
        it ' Fails when friend id is abscent' do
        user = User.create(name: "Jude", email: "kk7@gmail.com", password: "Heaven")
        user2 = User.create(name: "Jude", email: "kbg@gmail.com", password: "Heaven")
        f = user.friendships.create(user_id: user.id, friend_id: user2.id, confirmed:false)
        expect(f).to eql(false)
        end
    end
end
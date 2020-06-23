require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'has to be for a user' do
    friendship = Friendship.reflect_on_association(:user)
    expect(friendship.macro).to eq(:belongs_to)
  end

  context 'Mutual friend' do
    let(:user1) {User.create(name: 'Lillian', email: 'lil@gmail.com', password: 'blessing')}
    let(:user2) {User.create(name: 'Esie', email: 'esther@gmail.com', password: 'blessing')}
    let(:user3) {User.create(name: 'Jude', email: 'jude@gmail.com', password: 'ChristLord')}


  end
end

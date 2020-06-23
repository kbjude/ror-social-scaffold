class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def mutual
    user.friends = friend.friends
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverted_friendships,
           -> { where confirmed: false },
           class_name: 'Friendship',
           foreign_key: 'friend_id', dependent: :destroy
  has_many :friend_requests, through: :inverted_friendships, source: :user
  has_many :pending_friendships,
           -> { where confirmed: false },
           class_name: 'Friendship',
           foreign_key: 'user_id', dependent: :destroy
  has_many :pending_friends, through: :pending_friendships, source: :friend
  has_many :confirmed_friendships, -> { where confirmed: true }, class_name: 'Friendship'
  has_many :confirmed_inverse_friendships,
           -> { where confirmed: true },
           class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends_array = friendships.map do |friendship|
      friendship.friend if friendship.confirmed
    end + inverse_friendships.map do |friendship|
            friendship.user if friendship.confirmed
          end
    friends_array.compact
  end

  def decline(user)
    inverse_friendships.where(user_id: user.id).first.destroy
  end

  def confirm(user)
    friendship = inverse_friendships.find do |friend|
      friend.user == user
    end
    friendship.confirmed = true
    friendship.save
  end

  def send_request(user)
    friendships.create(friend_id: user.id, confirmed: false) unless pending_friends.include?(user)
  end

  def friend?(user)
    friends.include?(user)
  end

  def friends_posts
    @user if current_user.friend.include?(@user)
  end
end

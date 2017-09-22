class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :replies
  has_many :tweets

  has_many :leaders, :class_name => 'Following', :foreign_key => 'follower_id'
  has_many :followers, :class_name => 'Following', :foreign_key => 'leader_id'

end

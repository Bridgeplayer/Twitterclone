class Tweet < ApplicationRecord

	has_many :replies
	has_many :likes
	belongs_to :user

	validates(:post, presence: true)


end
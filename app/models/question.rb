class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	has_many :votes, as: :votable
	has_many :comments, as: :commentable

	validates :name, presence: true
	validates :body, presence: true, length: { minimum: 250 }

	def question_voted_by?(user)
   	votes.exists?(user: user)
    end
end

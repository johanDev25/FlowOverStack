class Answer < ApplicationRecord
  has_many :comments, as: :commentable
end

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def comments
    Comment.where(commentable: commentable, parent_id: id)
  end
end

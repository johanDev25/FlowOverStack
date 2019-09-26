class CommentsController < ApplicationController
	before_action :authenticate_user!
    def create
    if params.include?(:commentable_id)
      answer = Answer.find(params[:commentable_id])

      comment = answer.comments.build
      comment.body = params[:body]
      comment.user_id = current_user.id
      comment.save

      redirect_to answer.question

    else
      question = Question.find(params[:question_id])
      question.comments.create(comments_params)
      redirect_to question
    end
    
  end
  private
    def comments_params
      params.require(:comment).permit(:body,:commentable_type).merge(user: current_user)
    end
end

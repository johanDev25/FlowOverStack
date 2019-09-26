class VotesController < ApplicationController
		def create

		if params.include?(:answer_id)

			answer = Answer.find(params[:answer_id])
			answer.votes.create(user: current_user)

			redirect_to answer.question


		else
				
			question = Question.find(params[:question_id])
			question.votes.create(user: current_user)

			redirect_to question
		end
	
	end

	def destroy

	  if params.include?(:answer_id)
	  	answer = Answer.find(params[:answer_id])
	  	answer.votes.where(user: current_user).take.try(:destroy)
	  	redirect_to answer.question
	  else

	    question = Question.find(params[:question_id])
	    question.votes.where(user: current_user).take.try(:destroy)
	    redirect_to question
	 end
	end
end

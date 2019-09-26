class QuestionsController < ApplicationController
	before_action :authenticate_user!
	def index
		@questions = Question.all
	end

	def search
		palabra = "%#{params[:q]}%"
		@questions = Question.where("name LIKE ?",palabra)
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.user = current_user
		if @question.save
			redirect_to questions_path, notice: "La pregunta fue publicada con exito"
		else
			render :new
		end
	end

	def show
	   @question = Question.find(params[:id])
	end

	private

	def question_params
		params.require(:question).permit(:name, :body)
	end
end

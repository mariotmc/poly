class AnswersController < ApplicationController
  before_action :set_question, only: %i[new create]
  before_action :set_question_url, only: %i[new create]

  def new
    @answer = @question.answers.new
  end
  
  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question_url
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:correct, :content)
    end

    def set_question
      @question = Question.find_by(id: params[:question_id])
    end

    def set_question_url
      case @question.questionable_type
      when "MultipleChoiceQuestion"
        @question_url = multiple_choice_question_path(@question)
      end
    end
end
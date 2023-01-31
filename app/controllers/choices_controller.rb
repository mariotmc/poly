class ChoicesController < ApplicationController
  before_action :set_question, only: %i[new create]
  before_action :set_question_path, only: %i[new create]

  def new
    @answer = @question.multiple_choice_challenge.choices.new
  end
  
  def create
    @answer = @question.multiple_choice_challenge.choices.new(answer_params)

    if @answer.save
      redirect_to @question_path
    end
  end

  private
    def answer_params
      params.require(:choice).permit(:correct, :content)
    end

    def set_question
      @question = Question.find(params[:multiple_choice_challenge_id])
    end

    def set_question_path
      @question_path = multiple_choice_challenge_path(@question)
    end
end
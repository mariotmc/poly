class ChoicesController < ApplicationController
  before_action :set_question, only: %w[new create]
  before_action :set_question_path, only: %w[new create]

  def new
    @choice = @question.multiple_choice_challenge.choices.new
  end
  
  def create
    @choice = @question.multiple_choice_challenge.choices.new(choice_params)

    if @choice.save
      redirect_to @question_path
    end
  end

  private
    def choice_params
      params.require(:choice).permit(:correct, :content)
    end

    def set_question
      @question = Question.find(params[:multiple_choice_challenge_id])
    end

    def set_question_path
      @question_path = multiple_choice_challenge_path(@question)
    end
end
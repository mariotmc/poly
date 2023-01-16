class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = MultipleChoiceQuestion.new
  end

  def create
    @question = MultipleChoiceQuestion.new(question_params)

    if @question.save
      redirect_to root_path
    end
  end

  private

    def question_params
      params.require(:multiple_choice_question).permit(:title)
    end
end

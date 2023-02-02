class MultipleChoiceChallengesController < ApplicationController
  def new
    @question = MultipleChoiceChallenge.new
  end

  def create
    @question = MultipleChoiceChallenge.new(question_params)

    if @question.save
      redirect_to root_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @choices = @question.multiple_choice_challenge.choices
  end

  private
    def question_params
      params.require(:multiple_choice_challenge).permit(:title)
    end
end

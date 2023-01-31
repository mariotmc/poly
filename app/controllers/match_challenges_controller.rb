class MatchChallengesController < ApplicationController
  def new
    @question = MatchChallenge.new
  end

  def create
    @question = MatchChallenge.new(question_params)

    if @question.save
      redirect_to root_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @sources = @question.match_challenge.sources.sort
    @partners = @question.match_challenge.partners.sort
  end

  private
    def question_params
      params.require(:match_challenge).permit(:title)
    end
end

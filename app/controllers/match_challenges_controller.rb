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
    @match_challenge = @question.match_challenge
    @sources = @match_challenge.sources.order_by_position
    @partners = @match_challenge.partners.order_by_position
  end

  private
    def question_params
      params.require(:match_challenge).permit(:title)
    end
end

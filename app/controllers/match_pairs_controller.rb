class MatchPairsController < ApplicationController
  before_action :set_question, only: %w[new create]
  before_action :set_question_path, only: %w[new create]

  def new
    @match_pair = MatchPair.new
  end

  def create
    @match_pair = MatchPair.new(match_pair_params)
    
    if @match_pair.save
      redirect_to @question_path
    end
  end

  private
    def match_pair_params
      params.require(:match_pair).permit(:source, :partner, :match_challenge_id)
    end

    def set_question
      @question = Question.find(params[:match_challenge_id])
    end

    def set_question_path
      @question_path = match_challenge_path(@question)
    end
end
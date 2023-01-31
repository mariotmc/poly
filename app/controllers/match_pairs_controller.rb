class MatchPairsController < ApplicationController
  before_action :set_match_challenge, only: %w[new]

  def new
    @match_pair = MatchPair.new
  end

  def create
    @match_pair = MatchPair.new(match_pair_params)
    
    if @match_pair.save
      redirect_to root_path
    end
  end

  private
    def match_pair_params
      params.require(:match_pair).permit(:source, :partner, :match_challenge_id)
    end

    def set_match_challenge
      @match_challenge = Question.find(params[:match_challenge_id]).match_challenge.id
    end
end
class MatchPair
  include ActiveModel::Model

  attr_accessor :source, :partner, :match_challenge_id

  def save
    ActiveRecord::Base.transaction do
      @partner = Partner.create(content: partner)
      @source = Source.create(content: source, match_challenge_id: match_challenge_id, partner_id: @partner.id)
      set_positions(match_challenge_id, @source, @partner)
      @source.save!
      @partner.save!
    end
  end

  private
    def set_positions(match_challenge_id, source, partner)
      match_challenge = MatchChallenge.find(match_challenge_id)

      if match_challenge.sources.count > 1
        position = match_challenge.sources.count - 1
        source.position = position
        partner.position = position
      end
    end
end
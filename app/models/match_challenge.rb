class MatchChallenge < ApplicationRecord
  include Questionable
  
  has_many :sources
  has_many :partners, through: :sources
end

class MatchChallenge < ApplicationRecord
  include Questionable
  
  has_many :sources, dependent: :destroy
  has_many :partners, through: :sources
end

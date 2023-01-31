class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  
  delegated_type :questionable, types: %w[MultipleChoiceQuestion MatchingPairQuestion MultipleChoiceChallenge MatchChallenge], dependent: :destroy, optional: true
end

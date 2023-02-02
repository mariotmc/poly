class Question < ApplicationRecord
  delegated_type :questionable, types: %w[MultipleChoiceChallenge MatchChallenge], dependent: :destroy
end

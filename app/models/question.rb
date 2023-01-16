class Question < ApplicationRecord
  delegated_type :questionable, types: %w[MultipleChoiceQuestion], dependent: :destroy, optional: true
end

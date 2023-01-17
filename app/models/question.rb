class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  
  delegated_type :questionable, types: %w[MultipleChoiceQuestion], dependent: :destroy, optional: true
end

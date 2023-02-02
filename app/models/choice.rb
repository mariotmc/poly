class Choice < ApplicationRecord
  belongs_to :multiple_choice_challenge

  scope :correct, -> { where(correct: true) }
end

class Choice < ApplicationRecord
  belongs_to :multiple_choice_challenge
  has_one :answer

  scope :correct, -> { where(correct: true) }
end

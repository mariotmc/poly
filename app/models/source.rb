class Source < ApplicationRecord
  belongs_to :match_challenge
  belongs_to :partner

  scope :order_by_position, -> { order(position: :asc) }
  scope :correct, -> { where(correct: true) }
end

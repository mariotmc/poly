class Partner < ApplicationRecord
  has_one :source

  scope :order_by_position, -> { order(position: :asc) }
end

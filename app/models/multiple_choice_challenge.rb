class MultipleChoiceChallenge < ApplicationRecord
  include Questionable

  has_many :choices, dependent: :destroy
end

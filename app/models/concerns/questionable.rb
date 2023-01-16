module Questionable
  extend ActiveSupport::Concern

  included do
    has_one :question, as: :questionable

    before_validation :set_question, on: :create
  end

  def title
    @title ||= "test title"
  end

  private

    def set_question
      self.question = Question.new(title: title)
    end
end

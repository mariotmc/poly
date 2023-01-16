module Questionable
  extend ActiveSupport::Concern

  included do
    has_one :question, as: :questionable

    before_validation :set_question, on: :create

    attr_writer :title
  end

  def title
    @title ||= question&.title
  end

  private
    def set_question
      self.question = Question.new(title: title)
    end
end

class RemoveTitleFromMultipleChoiceQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :multiple_choice_questions, :title, :string
  end
end

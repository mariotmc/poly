class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :answers
    drop_table :multiple_choice_questions
    drop_table :match_pair_questions
    remove_column :choices, :answer_id
    remove_column :multiple_choice_challenges, :question_id
    remove_column :multiple_choice_challenges, :choice_id
  end
end

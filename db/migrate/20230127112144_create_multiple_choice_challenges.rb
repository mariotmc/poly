class CreateMultipleChoiceChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :multiple_choice_challenges do |t|
      t.references :question, foreign_key: true
      t.references :choice, foreign_key: true
      t.timestamps
    end
  end
end

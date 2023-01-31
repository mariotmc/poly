class CreateMatchPairQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :match_pair_questions do |t|

      t.timestamps
    end
  end
end

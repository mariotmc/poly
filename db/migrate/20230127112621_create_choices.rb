class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.references :multiple_choice_challenge, foreign_key: true
      t.references :answer, foreign_key: true
      t.text "content"
      t.boolean "correct"
      t.timestamps
    end
  end
end

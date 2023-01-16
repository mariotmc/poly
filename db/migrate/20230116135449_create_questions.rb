class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :questionable_type
      t.integer :questionable_id

      t.timestamps
    end
  end
end

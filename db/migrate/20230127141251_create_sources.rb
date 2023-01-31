class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources do |t|
      t.references :match_challenge, foreign_key: true
      t.references :partner, foreign_key: true
      t.text "content"
      t.integer "position", default: 0
      t.boolean "correct"
      t.timestamps
    end
  end
end

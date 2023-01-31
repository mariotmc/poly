class CreateMatchChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :match_challenges do |t|

      t.timestamps
    end
  end
end

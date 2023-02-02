class AddDefaultToCorrect < ActiveRecord::Migration[7.0]
  def change
    change_column :sources, :correct, :boolean, :default => false
  end
end

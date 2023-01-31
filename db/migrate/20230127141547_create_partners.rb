class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.text "content"
      t.integer "position", default: 0
      t.timestamps
    end
  end
end

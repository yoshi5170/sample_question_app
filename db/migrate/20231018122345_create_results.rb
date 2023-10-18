class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.integer :min_score, null: false
      t.integer :max_score, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end

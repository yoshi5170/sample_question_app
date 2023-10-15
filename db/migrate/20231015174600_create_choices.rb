class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.references :diagnosis_question, null: false, foreign_key: true
      t.string :choice_text, null:false
      t.integer :score, null:false

      t.timestamps
    end
  end
end

class CreateDiagnosisResults < ActiveRecord::Migration[7.0]
  def change
    create_table :diagnosis_results do |t|
      t.integer :score_range_start, null:false
      t.integer :score_range_end, null:false
      t.text :result_text, null:false

      t.timestamps
    end
  end
end

class CreateDiagnosisQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :diagnosis_questions do |t|
      t.string :question_text, null:false

      t.timestamps
    end
  end
end

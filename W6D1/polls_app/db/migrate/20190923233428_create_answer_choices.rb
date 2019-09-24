class CreateAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.text "text"
      t.string "question_id"
      t.timestamps
    end
  end
end

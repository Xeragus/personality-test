class CreateResponsesAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :responses_answers do |t|
      t.belongs_to :personality_test_response, null: false, foreign_key: true
      t.belongs_to :answer, null: false, foreign_key: true
      t.timestamps
    end
  end
end

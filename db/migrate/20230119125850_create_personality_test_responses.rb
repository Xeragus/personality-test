class CreatePersonalityTestResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :personality_test_responses do |t|
      t.integer :score
      t.belongs_to :personality_type, null: false, foreign_key: true
      t.timestamps
    end
  end
end

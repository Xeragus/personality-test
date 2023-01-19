class CreatePersonalityTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :personality_types do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
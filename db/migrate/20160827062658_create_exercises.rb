class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :type_of_exercise
      t.string :amount_of_time
      t.string :times_per_weak
      t.references :nutrition_history, foreign_key: true

      t.timestamps
    end
  end
end

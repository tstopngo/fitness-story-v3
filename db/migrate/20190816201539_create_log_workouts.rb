class CreateLogWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :log_workouts do |t|
      t.integer :reps
      t.belongs_to :workout_id, foreign_key: true
      t.belongs_to :log_id, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLogWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :log_workouts do |t|
      t.integer :amount
      t.belongs_to :workout, foreign_key: true
      t.belongs_to :log, foreign_key: true

      t.timestamps
    end
  end
end

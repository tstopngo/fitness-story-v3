class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :calories
      t.integer :workout_time

      t.timestamps
    end
  end
end

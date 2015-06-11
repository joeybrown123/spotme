class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :workout_type
      t.integer :duration_mins
      t.date :date
      t.integer :user_id

      t.timestamps

    end
  end
end

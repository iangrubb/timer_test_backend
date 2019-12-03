class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      t.boolean :running, default: false
      t.float :seconds_remaining
      t.datetime :completion_time

      t.timestamps
    end
  end
end

class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      t.integer :seconds_remaining

      t.timestamps
    end
  end
end

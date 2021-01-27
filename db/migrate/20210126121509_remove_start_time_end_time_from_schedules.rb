class RemoveStartTimeEndTimeFromSchedules < ActiveRecord::Migration[5.0]
  def change
    remove_column :schedules, :start_time, :integer
    remove_column :schedules, :end_time, :integer
  end
end

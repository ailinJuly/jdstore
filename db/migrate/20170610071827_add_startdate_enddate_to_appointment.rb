class AddStartdateEnddateToAppointment < ActiveRecord::Migration[5.0]
  def change
      add_column :appointments, :start_date, :date
      add_column :appointments, :end_date, :date
  end
end

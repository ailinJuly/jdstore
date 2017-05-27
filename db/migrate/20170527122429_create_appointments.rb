class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :phone
      t.string :date

      t.timestamps
    end
  end
end

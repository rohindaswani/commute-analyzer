class CreateCommuteTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :commute_times do |t|
      t.datetime :leave_at
      t.references :origin, foreign_key: { to_table: "locations" }
      t.references :destination, foreign_key: { to_table: "locations" }
      t.string :distance
      t.string :route_summary
      t.string :optimistic_time
      t.string :best_guess_time
      t.string :pessimistic_time
      t.text :warnings

      t.timestamps
    end
  end
end

class CommuteTime < ApplicationRecord
  belongs_to :origin, class_name: "Location"
  belongs_to :destination, class_name: "Location"

  def self.pessimistic_time
    CommuteTime.all.map do |commute|
      t = commute.leave_at
      rounded_t = t-t.sec-t.min%15*60
      [rounded_t.strftime("%H:%M:%S, %m/%d/%Y"), commute.pessimistic_time.to_i / 60]
    end
  end
end

class Location < ApplicationRecord
  has_many :origins, class_name: "CommuteTime", foreign_key: "origin_id"
  has_many :destinations, class_name: "CommuteTime", foreign_key: "destination_id"
end
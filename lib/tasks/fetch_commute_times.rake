desc "Fetch and create commute times every 15 min"
task fetch_commute_times: :environment do
  maps = GoogleMapsApi.new
  home_location = Location.find_by(name: "home")
  work_location = Location.find_by(name: "work")
  maps.add_origin(home_location.coordinates_decimal_degrees)
  maps.add_destination(work_location.coordinates_decimal_degrees)
  maps.add_departure_time("now")
  maps.add_mode("driving")
  maps.add_traffic_model("optimistic")

  leave_at = DateTime.now

  response_optimisitc = maps.execute

  maps.add_traffic_model("pessimistic")
  response_pessimistic = maps.execute

  maps.add_traffic_model("best_guess")
  response_best_guess = maps.execute

  CommuteTime.create(leave_at: leave_at) do |c|
    c.origin = home_location
    c.destination = work_location
    c.distance = response_best_guess["routes"].first["legs"].first["distance"]["value"]
    c.route_summary = response_best_guess["routes"].first["summary"]
    c.warnings = response_best_guess["routes"].first["warnings"].join(",")

    c.optimistic_time = response_optimisitc["routes"].first["legs"].first["duration_in_traffic"]["value"]
    c.best_guess_time = response_best_guess["routes"].first["legs"].first["duration_in_traffic"]["value"]
    c.pessimistic_time = response_pessimistic["routes"].first["legs"].first["duration_in_traffic"]["value"]
  end
end
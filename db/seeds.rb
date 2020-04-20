def add_home_coordinates(home_coords)
  Location.create(name: "home", coordinates_decimal_degrees: home_coords["coordinates_decimal_degrees"])
end

def add_work_coordinates(work_coords)
  Location.create(name: "work", coordinates_decimal_degrees: work_coords["coordinates_decimal_degrees"])
end


path = File.join(File.dirname(__FILE__), "/seeds/locations.json")
records = JSON.parse(File.read(path))
add_home_coordinates(records["home"])
add_work_coordinates(records["work"])
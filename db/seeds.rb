def add_home_coordinates
  Location.create(name: "home", coordinates_decimal_degrees: "37.730679,-122.440597")
end

def add_work_coordinates
  Location.create(name: "work", coordinates_decimal_degrees: "37.561807,-122.324830")
end

add_home_coordinates
add_work_coordinates
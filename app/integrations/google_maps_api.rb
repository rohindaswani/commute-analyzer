require "uri"
require 'addressable/uri'
require 'net/http'

class GoogleMapsApi
  include Addressable

  def initialize
    @api_key = Rails.application.credentials.google_maps_api_key
    @uri = Addressable::URI.parse("https://maps.googleapis.com/maps/api/directions/json?")
    @parameters = {}
  end

  def add_origin(coordinates)
    @parameters["origin"] = coordinates.delete("\s")
  end

  def add_destination(coordinates)
    @parameters["destination"] = coordinates.delete("\s")
  end

  def add_mode(mode)
    @parameters["mode"] = mode
  end

  def add_traffic_model(model)
    @parameters["traffic_model"] = model
  end

  def add_departure_time(time)
    @parameters["departure_time"] = time
  end

  def execute
    @parameters["key"] = @api_key
    @uri.query_values = @parameters

    JSON.parse(::Net::HTTP.get(@uri))
  end

  def self.run
    maps = GoogleMapsApi.new
    maps.add_origin("37.730679, -122.440597")
    maps.add_destination("37.561807, -122.324830")
    maps.add_departure_time("now")
    maps.add_mode("driving")
    maps.add_traffic_model("best_guess")
    maps.execute
  end
end
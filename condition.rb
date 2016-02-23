class Condition
  def initialize(location)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{location}.json")
  end

  def temperature
    arr = [@response["current_observation"]["temperature_string"], @response["current_observation"]["feelslike_string"]]
    return arr
  end

  def weather_overview
    @response["current_observation"]["weather"]
  end

  def humidity
    @response["current_observation"]["relative_humidity"]
  end

  def wind
    @response["current_observation"]["wind_string"].downcase
  end

  def location
    @response["current_observation"]["display_location"]["full"]
  end
end

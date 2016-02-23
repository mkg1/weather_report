class Condition
  def initialize(location)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

  def temperature
    @response["current_observation"]["temp_f"]
  end

  def location
    @response["current_observation"]["display_location"]["full"]
  end
end

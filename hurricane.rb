require 'json'

class Hurricane
  def initialize(location)
    @response = JSON.parse(File.read("hurricanes.json"))
  end

  def current_hurricane_list
    storms = @response["currenthurricane"]
    storms.each do |s|
        name = s["stormInfo"]["stormName_Nice"]
        windspeed = s["Current"]["WindSpeed"]["Mph"]
        direction_angle = s["Current"]["Movement"]["Degrees"]
        direction = s["Current"]["Movement"]["Text"]
        puts "Currently, #{name} is moving at #{windspeed} miles per hour and heading #{direction_angle} #{direction}."
      end
  end
end

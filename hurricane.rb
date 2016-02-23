class Hurricane
  def initialize(location)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/currenthurricane/q/#{location}.json")
  end

  def current_hurricane_list
    storms = @response["currenthurricane"]
    hurricane_array = []
    storms.each do |s|
      hurricane_array << "#{s["stormInfo"]["stormName_Nice"]} is moving at #{s["Current"]["WindSpeed"]["Mph"]} miles per hour and heading #{s["Current"]["Movement"]["Degrees"]} #{s["Current"]["Movement"]["Text"]}."
    end
    hurricane_array
  end
end

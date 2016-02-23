class Astronomy
  def initialize(location)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zip}.json")
  end

  def sunrise
    "#{@response["sun_phase"]["sunrise"]["hour"]}:#{@response["sun_phase"]["sunrise"]["minute"]}"
  end

  def sunset
    "#{@response["sun_phase"]["sunset"]["hour"]}:#{@response["sun_phase"]["sunset"]["minute"]}"
  end
end

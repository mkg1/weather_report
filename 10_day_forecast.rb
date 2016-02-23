class Forecast10Day
  def initialize(location)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{location}.json")
  end

  def daily_overview
    daily = []
    ten_days = @response["forecast"]["txt_forecast"]["forecastday"]
    ten_days.each do |t|
      daily << "#{t["title"]}: #{t["fcttext"]}"
    end
    daily
  end
end

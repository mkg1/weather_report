require 'json'
class Forecast10Day
  def initialize(location)
    @response = JSON.parse(File.read('10_day_forecast.json'))
    # @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")
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

# d = Forecast10Day.new(28779)
# puts d.daily_overview[5]

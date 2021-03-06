require 'minitest/autorun'
require 'minitest/pride'
require './endpoints.rb'
require 'httparty'
# weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")

class Condition
  def initialize(location)
    @response = JSON.parse(File.read("conditions.json"))
  end
end

class Forecast10Day
  def initialize(location)
    @response = JSON.parse(File.read("10_day_forecast.json"))
  end
end

class Astronomy
  def initialize(location)
    @response = JSON.parse(File.read("astronomy.json"))
  end
end

class Alert
  def initialize(location)
    @response = JSON.parse(File.read("alerts.json"))
  end
end

class Hurricane
  def initialize(location)
    @response = JSON.parse(File.read("hurricanes.json"))
  end
end

class WeatherTest < Minitest::Test
  def test_classes_exist
    assert Condition
    assert Forecast10Day
    assert Astronomy
    assert Alert
    assert Hurricane
  end

  def test_conditions
    c = Condition.new(28779)
    assert_equal "54.3 F (12.4 C)", c.temperature[0]
    assert_equal "54.3 F (12.4 C)", c.temperature[1]
    assert_equal "Sylva, NC", c.location
    assert_equal "Rain", c.weather_overview
    assert_equal "97%", c.humidity
    assert_equal "Calm", c.wind
  end

  def test_10_day_forecast
    f = Forecast10Day.new(28779)
    assert_equal "Monday: Cloudy with rain. Lows overnight in the upper 40s.", f.daily_overview[0]
    assert_equal "Wednesday Night: Cloudy with rain and snow showers in the evening. Snow showers overnight. Low 33F. Winds W at 10 to 20 mph. Chance of precip 60%. Snow accumulations less than one inch.", f.daily_overview[5]
  end

  def test_sunrise_time
    a = Astronomy.new(28779)
    assert_equal "7:11", a.sunrise
    assert_equal "18:21", a.sunset
  end

  def test_alerts
    alert = Alert.new(28779)
    assert_equal "High Wind Watch", alert.description[0]
    assert_equal "1:00 PM EST on February 24, 2016", alert.expiration[0]
  end

  def test_hurricanes
    h = Hurricane.new(28779)
    assert_equal "Invest 90C is moving at 35 miles per hour and heading 25 NNE.", h.current_hurricane_list[0]
    assert_equal "Tropical Cyclone Winston is moving at 100 miles per hour and heading 150 SSE.", h.current_hurricane_list[1]
  end
end

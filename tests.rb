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

# class Forecast10Day
#   def initialize(location)
#     @response = JSON.parse(File.read("conditions2.json"))
#   end
# end

class Astronomy
  def initialize(location)
    @response = JSON.parse(File.read("astronomy.json"))
  end
end

# class Alerts
# end

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
    assert Alerts
    assert Hurricane
  end

  def test_conditions
    c = Condition.new(94101)
    assert_equal "54.3 F (12.4 C)", c.temperature[0]
    assert_equal "54.3 F (12.4 C)", c.temperature[1]
    assert_equal "Sylva, NC", c.location
    assert_equal "Rain", c.weather_overview
    assert_equal "97%", c.humidity
    assert_equal "Calm", c.wind
  end

  # def test_10_day_forecast
  #
  # end

  def test_sunrise_time
    a = Astronomy.new(94101)
    assert_equal "7:11", a.sunrise
    assert_equal "18:21", a.sunset
  end

  # def test_alerts
  # end

  def test_hurricanes
    h = Hurricane.new(28779)
    assert_equal "Invest 90C is moving at 35 miles per hour and heading 25 NNE.", h.current_hurricane_list[0]
    assert_equal "Tropical Cyclone Winston is moving at 100 miles per hour and heading 150 SSE.", h.current_hurricane_list[1]
  end
end

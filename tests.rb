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
    assert Hurricanes
  end

  def test_conditions
    c = Condition.new(94101)
    assert_equal 66.1, c.temperature
    assert_equal "San Francisco, CA", c.location
  end

  # def test_10_day_forecast
  #
  # end

  def test_sunrise_time
    a = Astronomy.new(94101)
    assert_equal "6:51", a.sunrise
    assert_equal "17:55", a.sunset
  end

  # def test_alerts
  # end

  def test_hurricanes
    h = Hurricane.new(94101)
    h.current_hurricane_list
    # assert_equal ["90C", "Winston"], hurricane.current_hurricanes
  end
end

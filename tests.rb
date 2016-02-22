require 'minitest/autorun'
require 'minitest/pride'
require './endpoints.rb'
require 'httparty'
require './forecast.rb'
# weather = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")

class WeatherTest < Minitest::Test
  def test_classes_exist
    assert Conditions
    assert Forecast10Day
    assert Astronomy
    assert Alerts
    assert Hurricanes
  end
end

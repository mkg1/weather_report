require 'httparty'
require './endpoints.rb'
require 'json'

puts "Enter a zipcode:"
zip = gets.chomp
a = Alert.new(zip)
astro = Astronomy.new(zip)
c = Condition.new(zip)
f = Forecast10Day.new(zip)
h = Hurricane.new(zip)

puts "In #{c.location}, the current weather is looking like: #{c.weather_overview}."
puts ""
puts "The temperature is #{c.temperature[0]} but feels like #{c.temperature[1]}."
puts ""
puts "The humidity is #{c.humidity} and the wind is #{c.wind}."
puts ""
puts "Today, the sun will rise at #{astro.sunrise} and set at #{astro.sunset}."
puts ""
puts "The forecast for the next few days is: "

puts f.daily_overview[0]
puts f.daily_overview[2]
puts f.daily_overview[4]
puts f.daily_overview[6]
puts f.daily_overview[8]
puts f.daily_overview[10]
puts f.daily_overview[12]
puts f.daily_overview[14]
puts f.daily_overview[16]
puts f.daily_overview[18]
puts ""
puts "The following alerts are in effect for your area: "
puts a.description
puts ""
puts "This alert will expire at #{a.expiration}"
puts ""
puts a.message
puts ""
puts "There are currently #{h.current_hurricane_list.length} current or potential hurricanes happening around the world:"
puts h.current_hurricane_list

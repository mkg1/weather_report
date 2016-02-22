require 'httparty'

puts "Enter a zipcode:"
zip = gets.chomp

response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")

puts response
# puts "Location: #{response["current_observation"]["display_location"]["full"]}"
# puts "Current Temp (F): #{response["current_observation"]["temp_f"]}"
# puts city, state
#
# puts current temp

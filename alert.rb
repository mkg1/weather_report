require 'json'
class Alert
  def initialize(location)
    @response = HTTParty.get("http://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

  def description
    alerts = []
    @response["alerts"].each do |a|
      alerts << "#{a["description"]}"
    end
    alerts
  end

  def message
    messages = []
    @response["alerts"].each do |m|
      messages << "#{m["message"]}"
    end
    messages
  end

  def expiration
    expirations = []
    @response["alerts"].each do |e|
      expirations << "#{e["expires"]}"
    end
    expirations
  end
end

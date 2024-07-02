require "my_first_gem/version"
require 'net/http'

module MyFirstGem
  class Error < StandardError; end
  # Your code goes here...
  
  def self.call_external_api(url)
    url = URI.parse(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true if url.scheme == "https"

    request = Net::HTTP::Get.new(url.request_uri)

    response = http.request(request)

    if response.code == "200"
      # Process the response data here
      return response.body
    else
      raise StandardError, "API request failed with status code #{response.code}" 
    end
  end
end
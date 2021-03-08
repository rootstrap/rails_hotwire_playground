require 'net/http'

class FlickrService
  FLICKR_API_URL = 'https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key='.freeze

  def search(query)
    uri = URI.parse("#{FLICKR_API_URL}#{ENV['FLIKR_API_KEY']}&tags=#{query}&per_page=24&format=json&nojsoncallback=1")
    JSON.parse(Net::HTTP.get(uri))
  end
end

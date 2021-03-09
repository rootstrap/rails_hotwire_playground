require 'net/http'

class FlickrService
  FLICKR_API_HOST = 'api.flickr.com'.freeze
  FLICKR_API_PATH = '/services/rest/'.freeze
  QUERY_PARAMS = {
    method: 'flickr.photos.search',
    api_key: ENV['FLICKR_API_KEY'],
    per_page: 24,
    format: 'json',
    nojsoncallback: 1
  }.freeze

  def search(tags)
    JSON.parse(Net::HTTP.get(build_uri(tags)))
  end

  private

  def build_uri(tags)
    URI::HTTPS.build(host: FLICKR_API_HOST, path: FLICKR_API_PATH, query: QUERY_PARAMS.merge(tags: tags).to_query)
  end
end

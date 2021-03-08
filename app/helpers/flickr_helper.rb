module FlickrHelper
  def build_flickr_image_url(farm, server, id, secret)
    "https://farm#{farm}.staticflickr.com/#{server}/#{id}_#{secret}_m.jpg"
  end
end

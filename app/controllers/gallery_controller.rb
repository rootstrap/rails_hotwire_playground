class GalleryController < ApplicationController
  def index; end

  def images
    images = []

    if params[:query].present?
      results = FlickrService.new.search(params[:query])

      images = results['photos']['photo']
    end

    render partial: 'images', locals: { images: images }
  end
end

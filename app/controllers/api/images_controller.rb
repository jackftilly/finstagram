class Api::ImagesController < ApplicationController
  def index
    @images = Image.all_following(current_user.id, 0)
  end

  def create
    @image = Image.new(image_params);
    if (@image.save)
      img_hash = Cloudinary::Uploader.upload(@image.image_url);
      @image.image_url = img_hash[:url]
      render 'api/users/show'
    else
      render json: @image.errors.full_messages, status: 422
    end
  end

  private
  def image_params
    params.require(:image).permit(:image_url, :caption, :lat, :lng);
  end

end

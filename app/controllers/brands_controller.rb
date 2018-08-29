class BrandsController < ApplicationController
  LOREMIPSUM = "In fermentum ligula eget lacus vulputate, eget posuere sapien suscipit. Aliquam cursus felis diam, non sodales quam vulputate vel. Mauris ultricies dignissim est nec imperdiet. Phasellus luctus dictum velit finibus fermentum. Curabitur eleifend vehicula dapibus. Aliquam sagittis ante odio, quis gravida lectus vestibulum ut. Sed nisi leo, feugiat quis tempus id, suscipit et tortor. Curabitur et mi congue sem rutrum aliquam. Aliquam ac placerat nunc. Aenean augue nibh, malesuada vel libero et, laoreet tempor metus."
  def index
    @lorem_ipsum = LOREMIPSUM
    @brands = []
    @name = params[:brand]
    if @name != nil
      if Brand.all.where(name: @name).first
        @brands << Brand.all.where(name: @name).first
      else
        @brands << Brand.all.where(name: @name.capitalize).first
      end
    end
  end
end

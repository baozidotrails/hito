class Product < ActiveRecord::Base
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :product_image, ProductImageUploader

  after_update :crop_image

  def crop_image
    product_image.recreate_versions! if crop_x.present?
  end
end

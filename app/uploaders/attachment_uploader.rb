# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  before :cache, :setup_available_sizes

  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process :dynamic_resize_to_fit => :default
  
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :mini do
    process :dynamic_resize_to_fill => :mini
  end

  version :thumb, :if => :has_thumb_size? do
    process :dynamic_resize_to_fill => :thumb
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # a lame wrapper to resize_to_fill method
  def dynamic_resize_to_fill(size)
    resize_to_fill *(model.class::IMAGE_SIZES[size])
  end

  def dynamic_resize_to_fit(size)
    resize_to_fit *(model.class::IMAGE_SIZES[size])
  end

  def method_missing(method, *args)
    # we've already defined "has_VERSION_size?", so if a method with
    # similar name is missed, it should return false
    return false if method.to_s.match(/has_(.*)_size\?/)
    super
  end

  protected
  # the method called at the start
  # it checks for <model>::IMAGE_SIZES hash and define a custom method "has_VERSION_size?"
  # (more on this later in the article)
  def setup_available_sizes(file)
    model.class::IMAGE_SIZES.keys.each do |key|
      self.class_eval do
        define_method("has_#{key}_size?".to_sym) { |file| true }
      end
    end
  end

end

class ImageUploader < CarrierWave::Uploader::Base
  storage :fog

  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  def store_dir
    "images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def to_s
  #   self.source
  # end

  # def plain
  #   @client ||= Imgix::Client.new(host: ENV["IMGIX_SOURCE"], include_library_param: false, secure: true)
  #   output = @client.path("/#{self.default_path}")
  #   if self.path.present?
  #     output = @client.path("/#{self.path}")
  #   end
  #   output.to_url
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def default_url(*args)
    "https://#{ENV["AWS_S3_BUCKET"]}.s3.amazonaws.com/#{self.default_path}"
  end

  def default_path(*args)
    "images/#{model.class.to_s.underscore}/#{mounted_as}/default.png"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
    def secure_token(length=32)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end

    # store! nil's the cache_id after it finishes so we need to remember it for deletion
    def remember_cache_id(new_file)
      @cache_id_was = cache_id
    end

    def delete_tmp_dir(new_file)
      # make sure we don't delete other things accidentally by checking the name pattern
      if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
        FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
      end
    end

    # def source(opts={})
    #   width = opts[:width]
    #   height = opts[:height] || opts[:width]
    #   fit = opts[:fit] || "crop"
    #   @client ||= Imgix::Client.new(host: ENV["IMGIX_SOURCE"], include_library_param: false, secure: true)
    #   output = @client.path("/#{self.default_path}")
    #   if self.path.present?
    #     output = @client.path("/#{self.path}")
    #   end
    #   output.fit(fit)
    #   output = output.width(width) if width.present?
    #   output = output.height(height) if height.present?
    #   output.to_url
    # end

end
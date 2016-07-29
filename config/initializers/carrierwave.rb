CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: 'us-west-2'
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_directory  = ENV['S3_BUCKET_NAME']
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |image|
        image.quality(percentage.to_s)
        image = yeild(img) if block_given?
        image
      end
    end
  end
end

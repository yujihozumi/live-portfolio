require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_public = false
    config.fog_directory  = ENV['S3_BUCKET']
    config.asset_host = ENV['S3_HOST_NAME']
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :region => ENV['AWS_DEFAULT_REGION']
    }
  else # 本番環境以外の場合はアプリケーション内にアップロード
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end

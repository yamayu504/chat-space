require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage         = :fog
  config.fog_providor    = 'fog/aws'
  config.fog_credentials = {
    providoer: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }
  config.fog_directory   = 'update-test-yamayu504'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/update-test-yamayu504'
end

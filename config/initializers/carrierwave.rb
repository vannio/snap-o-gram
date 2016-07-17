CarrierWave.configure do |config|
  if Rails.env == 'production'
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET'],
      :region                 => 'eu-west-1'
    }
    config.fog_directory  = 'vannio'
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
  end
end

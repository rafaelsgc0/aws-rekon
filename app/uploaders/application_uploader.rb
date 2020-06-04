class ApplicationUploader < CarrierWave::Uploader::Base
  # Choose what kind of storage to use for uploaders
  if Rails.env.test?
    storage :file
  else
    storage :aws
  end
end

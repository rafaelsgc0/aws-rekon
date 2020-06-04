CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = Rails.application.secrets.aws_bucket
  # config.aws_acl    = 'public-read'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  config.aws_credentials = {
      access_key_id:     Rails.application.secrets.aws_access_key_id,
      secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region:            Rails.application.secrets.aws_region
  }

end


#
# CarrierWave.configure do |config|
#   config.storage    = :aws
#   config.aws_bucket = Rails.application.secrets.aws_bucket
#
#   # The maximum period for authenticated_urls is only 7 days.
#   config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
#
#   # Set custom options such as cache control to leverage browser caching
#   config.aws_attributes = {
#     expires: 1.week.from_now.httpdate,
#     cache_control: 'max-age=604800'
#   }
#
#   config.aws_credentials = {
#     access_key_id:     Rails.application.secrets.aws_access_key_id,
#     secret_access_key: Rails.application.secrets.aws_secret_access_key,
#     region:            Rails.application.secrets.aws_region
#   }
#
#   # Optional: Signing of download urls, e.g. for serving private content through
#   # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
#   # configured:
#   # config.aws_signer = -> (unsigned_url, options) do
#   #   Aws::CF::Signer.sign_url(unsigned_url, options)
#   # end
# end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage)
        img = yield(img) if block_given?
        img
      end
    end
  end
end

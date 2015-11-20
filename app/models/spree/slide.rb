class Spree::Slide < ActiveRecord::Base
  has_attached_file :image,
    storage:             :s3,
    s3_credentials: {
      access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    },
    bucket:              ENV['S3_BUCKET_NAME'],
    url:                 ':s3_alias_url',
    s3_host_alias:       ENV['CLOUDFRONT_DOMAIN'],
    path:                '/slider/:id/:style/:basename.:extension'

  scope :published, where(:published => true)
  attr_accessible :name, :body, :link_url, :published, :image
end

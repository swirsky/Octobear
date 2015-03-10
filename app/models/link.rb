require 'uri'

class Link < ActiveRecord::Base
  validates :url, :presence => true
  validate :valid_uri?
  after_save :sluggify!

  RANDOM_LINKS = ["dictionary.reference.com/browse/random",
                  "random.org", "en.wikipedia.org/wiki/Randomness",
                  "ruby-doc.org/core-2.2.0/Random.html"]
  RANDOM_AMOUNT = RANDOM_LINKS.count
  
  def get_slug
    "#{base_url}#{self.slug}"
  end

  def self.random_link
     "http://#{RANDOM_LINKS[rand(RANDOM_AMOUNT)]}"
  end

private

  def sluggify!
    #need to reload object to get ID
    self.update_column(:slug, (self.id+20).to_s(20))
  rescue
    errors.add(:slug, "Slug could not be generated")
  end

  def valid_uri?
    uri = URI.parse(url)
    unless uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
     errors.add(:url, "Invalid URL.  Must be valid HTTP/S")
    end
  rescue URI::InvalidURIError
    errors.add(:url, "Invalid URL.  Must be valid HTTP/S")
  end

  def base_url
    case Rails.env
    when "development"
      ENV['DEV_URL']
    when 'production'
      ENV['PROD_URL']
    end
  end
end

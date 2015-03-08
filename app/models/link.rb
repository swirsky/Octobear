class Link < ActiveRecord::Base
  
  RANDOM_LINKS = ["dictionary.reference.com/browse/random",
                  "random.org", "en.wikipedia.org/wiki/Randomness",
                  "ruby-doc.org/core-2.2.0/Random.html"]
  RANDOM_AMOUNT = RANDOM_LINKS.count
  
  def sluggify!
    self.slug = (self.id+20).to_s(20)
    self.save
  end

  def get_slug
    "#{base_url}/links/#{self.id}?slug=#{self.slug}"
  end

  def self.random_link
     "http://#{RANDOM_LINKS[rand(RANDOM_AMOUNT)]}"
  end

private

  def base_url
    case Rails.env
    when "development"
      ENV['DEV_URL']
    end
  end
end

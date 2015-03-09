require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  RSpec.describe 'sluggify' do
    @goodlink = Link.new(url:"http://www.google.com")
    @goodlink.save
    it "sluggify creates a slug" do
      @goodlink.slug.should eq nil
      @goodlink.sluggify!
      @goodlink.slug.should_not eq nil
      @goodlink.slug.should be_an_instance_of String
    end
  end

  RSpec.describe 'random' do
    it "random link is a string" do
      Link.random_link.should be_an_instance_of String
    end
  end
end

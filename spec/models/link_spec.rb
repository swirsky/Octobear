require 'rails_helper'

RSpec.describe Link, type: :model do
  it "good link gets created and slugged" do
      @link = Link.new(url:"http://www.google.com")
      @link.slug.should eq nil
      @link.save
      @link.slug.should_not eq nil
      @link.slug.should be_an_instance_of String
    end

  it "bad url does not get saved" do
    @link = Link.new(url:"I am totally a link I swear just trust me")
    @link.save.should == false
  end

  it "random link is a string" do
    @link = Link.random_link
    @link.should be_an_instance_of String
    @uri = URI.parse(@link)
    (@uri.kind_of?(URI::HTTP) || uri.kind_of(URI::HTTPS)).should eq true 
    end
end

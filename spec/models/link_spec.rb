require 'rails_helper'

RSpec.describe Link, type: :model do
  it "good link gets created and slugged" do
      @link = Link.new(url:'http://www.google.com')
      expect(@link.slug).to eq nil
      @link.save
      expect(@link.slug).to_not eq nil
      expect(@link.slug).to be_a(String)
    end

  it "bad url does not get saved" do
    @link = Link.new(url:"wobsite")
    expect(@link.save).to eq false
  end

  it "no url does not get saved" do
    @link = Link.new
    expect(@link.save).to eq false
  end

  it "random link gets a link" do
    @link = Link.random_link
    expect(@link).to be_a(String)
    @uri = URI.parse(@link)
    expect((@uri.kind_of?(URI::HTTP) || uri.kind_of(URI::HTTPS))).to eq true 
    end
end

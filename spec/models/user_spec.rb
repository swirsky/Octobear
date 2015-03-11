require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a factory" do
    expect(create(:user)).to be_valid
  end

  it "is invalid with bad email / password" do
    [nil, "", 12, true, false, "bad"].each do |p|
      u = User.new(email:p, password:"password")
      expect(u.save).to eq false
      u = User.new(email:"valid@test.com", password:p)
      expect(u.save).to eq false
    end
  end

end

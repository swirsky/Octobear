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

  it 'valid user saves and gets callbacks' do
    u = build(:user)
    expect(u.save).to eq true
    expect(u.password).to be nil
    expect(u.salt).to be nil
    expect(u.encrypted_password).to_not be nil
    expect(u.access_role).to_not be nil
  end

end

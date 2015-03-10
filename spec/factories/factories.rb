FactoryGirl.define do
  factory :user do
    email 'john.doe@test.com'
    password 'password'
  end

  factory :link do
    url 'http://www.google.com'
  end
end

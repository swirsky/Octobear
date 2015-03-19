FactoryGirl.define do
  factory :one_time_pad do
    initial "MyString"
cypher "MyString"
output "MyString"
line_length 1
group_length 1
number_of_keys 1
key_length 1
seed ""
  end

end

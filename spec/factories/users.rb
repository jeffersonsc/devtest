FactoryGirl.define do
  factory :user do
    name FFaker::Name.name
    sequence(:email) { |n| "test_#{n}@test.com" }
    password '12345678'
    password_confirmation '12345678'
  end
end

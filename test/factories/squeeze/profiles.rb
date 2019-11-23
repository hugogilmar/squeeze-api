# frozen_string_literal: true

FactoryGirl.define do
  factory :profile do
    first_name { Faker::Internet.free_email }
    last_name { Faker::Internet.free_email }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :profile, class: Squeeze::Profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end

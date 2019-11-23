# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: Squeeze::User do
    email { Faker::Internet.free_email }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: Squeeze::User do
    email { Faker::Internet.free_email }
    password { Faker::Internet.password }
    after :create do |user|
      create :profile, user: user
    end
  end
end

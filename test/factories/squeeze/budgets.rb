# frozen_string_literal: true

FactoryBot.define do
  factory :budget, class: Squeeze::Budget do
    description { Faker::Lorem.word }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :income, class: Squeeze::Income do
    description { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end

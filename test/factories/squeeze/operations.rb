# frozen_string_literal: true

FactoryBot.define do
  factory :operation, class: Squeeze::Operation do
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end

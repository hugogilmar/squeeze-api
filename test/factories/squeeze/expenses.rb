# frozen_string_literal: true

FactoryBot.define do
  factory :expense, class: Squeeze::Expense do
    description { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end

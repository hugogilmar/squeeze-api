# frozen_string_literal: true

FactoryBot.define do
  factory :account, class: Squeeze::Account do
    description { Faker::Lorem.word }
    kind { %i[bank_account cash credit_card debit_card].sample }
    reference_number { Faker::Number.number(digits: 4) }
  end
end

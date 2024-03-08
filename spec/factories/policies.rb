# frozen_string_literal: true

FactoryBot.define do
  factory :policy do
    validity { 2.years.from_now }
    insured
  end
end

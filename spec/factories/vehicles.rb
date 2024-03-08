# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    model { 'Fit 1.4' }
    make { 'Honda' }
    plate { 'CFPA-8987' }
    year { '2007' }
    insured
  end
end

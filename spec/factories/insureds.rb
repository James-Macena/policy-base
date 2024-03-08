# frozen_string_literal: true

FactoryBot.define do
  factory :insured do
    name { 'Mr. Han' }
    document_number { '12345678062' }
    document_type { 'cpf' }
  end
end

# frozen_string_literal: true

class Insured < ApplicationRecord
  has_one :policy
  has_one :vehicle

  validates :name, :document_number, :document_type, presence: true
end

# frozen_string_literal: true

class Policy < ApplicationRecord
  belongs_to :insured
  has_one :vehicle, through: :insured

  validates :validity, presence: true
end

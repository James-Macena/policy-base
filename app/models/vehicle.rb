# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :insured

  validates :model, :make, :plate, :year, presence: true
end

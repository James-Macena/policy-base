# frozen_string_literal: true

class AddInsuredRefToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_reference :vehicles, :insured, null: false, foreign_key: true
  end
end

# frozen_string_literal: true

class AddInsuredRefToPolicies < ActiveRecord::Migration[7.1]
  def change
    add_reference :policies, :insured, null: false, foreign_key: true
  end
end

# frozen_string_literal: true

class CreateInsureds < ActiveRecord::Migration[7.1]
  def change
    create_table :insureds do |t|
      t.string :name, null: false
      t.string :document_number, null: false
      t.string :document_type, null: false

      t.timestamps
    end
  end
end

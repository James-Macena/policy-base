# frozen_string_literal: true

class CreatePolicy < ActiveRecord::Migration[7.1]
  def change
    create_table :policies do |t|
      t.date :validity, null: false

      t.timestamps
    end
  end
end

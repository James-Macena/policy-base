# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :model, null: false
      t.string :make, null: false
      t.string :plate, null: false
      t.string :year, null: false

      t.timestamps
    end
  end
end

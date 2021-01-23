# frozen_string_literal: true

class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.text :descritpion

      t.timestamps
    end
  end
end
